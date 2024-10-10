
import Foundation
import Foundation

// MARK: - LiveGame Model

struct LiveGameResponse: Codable {
    let success: Bool
    let data: LiveGameData?
}

struct LiveGameData: Codable {
    let match: [LiveGame]
}

struct LiveGame: Codable {
    let id: Int
    let location: String?
    let scheduled: String
    let status: String
    let fixture_id: Int
    let home: TeamModel
    let away: TeamModel
    let time: String
    let competition: Competition
    let scores: Scores
    let urls: MatchUrls
    let federation: Federation?
    var homeImageData: Data?
    var awayImageData: Data?
}

struct TeamModel: Codable {
    let id: Int
    let name: String
    let country_id: Int?
    let stadium: String
}


struct Competition: Codable {
    let is_cup: Bool
    let active: Bool
    let has_groups: Bool
    let national_teams_only: Bool
    let tier: Int
    let name: String
    let is_league: Bool
    let id: Int
}

struct Scores: Codable {
    let score: String?
    let htScore: String?
    let ftScore: String?
    let etScore: String?
    let psScore: String?

    enum CodingKeys: String, CodingKey {
        case score
        case htScore = "ht_score"
        case ftScore = "ft_score"
        case etScore = "et_score"
        case psScore = "ps_score"
    }
}

struct MatchUrls: Codable {
    let events: String
    let statistics: String
    let lineups: String
    let head2head: String
}

// MARK: - TeamLogoResponse Model

struct TeamLogoResponse: Codable {
    let success: Bool
    let data: TeamLogoData
}

struct TeamLogoData: Codable {
    let teams: [TeamLogo]
}

struct TeamLogo: Codable {
    let team: TeamDetails
}

struct TeamDetails: Codable {
    let id: Int
    let name: String
    let logo: String?
}

struct Federation: Codable {
    let id: Int
    let name: String
}

// MARK: - LiveGamesFetcher Class

class LiveGamesFetcher {
    private let baseURL = "https://livescore-api.com/api-client/matches/live.json?"
    private let apiKey = "u5BLAM9rfIolFAxH"
    private let secretKey = "vJcv5eUR4Ul86QnAVYlwLuX1dlnSWUAs"

    func fetchLiveGames(completion: @escaping (Result<[LiveGame], Error>) -> Void) {
        let urlString = "\(baseURL)&key=\(apiKey)&secret=\(secretKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                let liveGameResponse = try decoder.decode(LiveGameResponse.self, from: data)
            
                let filteredMatches = liveGameResponse.data?.match.filter { game in
                    return game.status == "IN PLAY" || game.status == "HALF TIME BREAK" || game.status == "ADDED TIME"
                }
                guard var filteredMatches = filteredMatches else {
                    completion(.success([]))
                    return
                }
                
                let dispatchGroup = DispatchGroup()
                for i in 0..<filteredMatches.count {
                    let team1CountryID = filteredMatches[i].home.country_id
                    let team2CountryID = filteredMatches[i].away.country_id
                    
                    let federation = filteredMatches[i].federation?.id
                    dispatchGroup.enter()
                    self.fetchTeams(countryID: team1CountryID, federationID: federation) { teams in
                        if let logoURL = teams.first?.team.logo {
                            self.downloadLogoImage(from: logoURL) { logoData in
                                filteredMatches[i].homeImageData = logoData
                            }
                        }
                        dispatchGroup.leave()
                    }
                    
                    dispatchGroup.enter()
                    self.fetchTeams(countryID: team1CountryID, federationID: federation) { teams in
                        print(teams)
                        if let logoURL = teams.first?.team.logo {
                            self.downloadLogoImage(from: logoURL) { logoData in
                                filteredMatches[i].awayImageData = logoData
                            }
                        } 
                        dispatchGroup.leave()
                    }
                }
                
//                fetcher.fetchTeamLogos(countryID: homeTeamID, federationID: federationID) { teams in
//                        if let logoURL = teams.first?.team.logo {
//                            fetcher.downloadLogoImage(from: logoURL) { image in
//                                print("Home team logo image downloaded: \(String(describing: image))")
//                            }
//                        }
//                    }
                dispatchGroup.notify(queue: .main) {
                    completion(.success(filteredMatches))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
        func fetchTeams(countryID: Int?, federationID: Int?, completion: @escaping ([TeamLogo]) -> Void) {
            var urlString: String
            if federationID == nil && countryID != nil {
                urlString = "https://livescore-api.com/api-client/teams/listing.json?key=\(apiKey)&secret=\(secretKey)&country_id=\(countryID!)"
            } else if countryID == nil && federationID != nil {
                urlString = "https://livescore-api.com/api-client/teams/listing.json?key=\(apiKey)&secret=\(secretKey)&federation_id=\(federationID!)"
            } else if countryID == nil && federationID == nil{
                urlString = "https://livescore-api.com/api-client/teams/listing.json?key=\(apiKey)&secret=\(secretKey)"
            } else {
                urlString = "https://livescore-api.com/api-client/teams/listing.json?key=\(apiKey)&secret=\(secretKey)&country_id=\(countryID!)&federation_id=\(federationID!)"
            }
            guard let url = URL(string: urlString) else {
                completion([])
                return
            }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching team logos: \(error)")
                    completion([])
                    return
                }

                guard let data = data else {
                    completion([])
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let teamLogoResponse = try decoder.decode(TeamLogoResponse.self, from: data)
                    completion(teamLogoResponse.data.teams)
                } catch {
                    print("Error decoding team logos: \(error)")
                    completion([])
                }
            }
            task.resume()
        }

        // Функция для загрузки изображения логотипа команды по URL
        func downloadLogoImage(from url: String, completion: @escaping (Data?) -> Void) {
            guard let imageUrl = URL(string: url) else {
                completion(nil)
                return
            }
            print(imageUrl)
            let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error = error {
                    print("Error downloading logo image: \(error)")
                    completion(nil)
                    return
                }

                guard let data = data else {
                    completion(nil)
                    return
                }

                completion(data)
            }
            task.resume()
        }
}
