import Foundation

// MARK: - Main Response
struct LiveGamesResponse: Codable {
    let get: String
    let parameters: Parameters
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [LiveGame]?
}

// MARK: - Parameters
struct Parameters: Codable {
    let league: String
}

// MARK: - Paging
struct Paging: Codable {
    let current: Int
    let total: Int
}

// MARK: - Live Game
struct LiveGame: Codable {
    let fixture: Fixture
    let league: LeagueModel
    var teams: Teams
    let status: GameStatus
    let update: String
}

// MARK: - Fixture
struct Fixture: Codable {
    let id: Int
    let status: FixtureStatus
}

// MARK: - Fixture Status
struct FixtureStatus: Codable {
    let long: String
    let elapsed: Int
    let seconds: String
}

// MARK: - League
struct LeagueModel: Codable {
    let id: Int
    let season: Int
}

// MARK: - Teams
struct Teams: Codable {
    var home: TeamModelData
    var away: TeamModelData
}

// MARK: - Team
struct TeamModelData: Codable {
    let id: Int
    let goals: Int?
    var name: String? // Добавляем поле для названия команды
    var logo: Data? // Поле для логотипа в формате Data
}

// MARK: - Game Status
struct GameStatus: Codable {
    let stopped: Bool
    let blocked: Bool
    let finished: Bool
}

// MARK: - Team Response
struct TeamResponse: Codable {
    let response: [TeamInfo]
}

struct TeamInfo: Codable {
    let team: TeamData
}

struct TeamData: Codable {
    let id: Int
    let name: String
    var logo: String?
}

class LiveGamesFetcher {
    let baseURL = "https://v3.football.api-sports.io"
        let liveEndpoint = "/odds/live?league="
        let teamEndpoint = "/teams?id="
        let apiKey = "5686c463cd600524039ea7adcf771562"
        let leagueIds = [141]

        // Функция для получения данных из нескольких лиг
        func fetchLiveGamesFromMultipleLeagues(completion: @escaping ([LiveGame]?, Error?) -> Void) {
            var allLiveGames: [LiveGame] = []
            let group = DispatchGroup()

            for leagueId in leagueIds {
                group.enter()
                fetchLiveGames(for: leagueId) { liveGames, error in
                    if let liveGames = liveGames {
                        allLiveGames.append(contentsOf: liveGames)
                    } else if let error = error {
                        print("Error fetching live games for league \(leagueId): \(error)")
                    }
                    group.leave()
                }
            }

            group.notify(queue: .main) {
                completion(allLiveGames, nil)
            }
        }

        // Функция для получения данных о живых играх для одной лиги
        func fetchLiveGames(for leagueId: Int, completion: @escaping ([LiveGame]?, Error?) -> Void) {
            guard let url = URL(string: baseURL + liveEndpoint + "\(leagueId)") else {
                completion(nil, NSError(domain: "Invalid URL", code: 1, userInfo: nil))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue(apiKey, forHTTPHeaderField: "x-rapidapi-key")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let liveGamesResponse = try decoder.decode(LiveGamesResponse.self, from: data)
                        var liveGames = liveGamesResponse.response ?? []

                        let group = DispatchGroup()

                        // Для каждой команды запрашиваем название
                        for i in 0..<liveGames.count {
                            group.enter()
                            self.fetchTeam(by: liveGames[i].teams.home.id) { teamModel, error in
                                if let teamModel = teamModel {
                                    liveGames[i].teams.home.name = teamModel.name
                                    liveGames[i].teams.home.logo = teamModel.logo
                                }
                                group.leave()
                            }

                            group.enter()
                            self.fetchTeam(by: liveGames[i].teams.away.id) { teamModel, error in
                                if let teamModel = teamModel {
                                    liveGames[i].teams.away.name = teamModel.name
                                    liveGames[i].teams.away.logo = teamModel.logo
                                }
                                group.leave()
                            }
                        }

                        group.notify(queue: .main) {
                            completion(liveGames, nil)
                        }

                    } catch {
                        completion(nil, error)
                    }
                } else {
                    completion(nil, NSError(domain: "Invalid response", code: 2, userInfo: nil))
                }
            }

            task.resume()
        }
    
    func fetchTeam(by teamId: Int, completion: @escaping (TeamModelData?, Error?) -> Void) {
        guard let url = URL(string: baseURL + teamEndpoint + "\(teamId)") else {
            completion(nil, NSError(domain: "Invalid URL", code: 1, userInfo: nil))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "x-rapidapi-key")

        let task: URLSessionDataTask = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(nil, error)
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                guard httpResponse.statusCode == 200 else {
                    completion(nil, NSError(domain: "Invalid response", code: httpResponse.statusCode, userInfo: nil))
                    return
                }
            }

            guard let data = data else {
                completion(nil, NSError(domain: "No data received", code: 3, userInfo: nil))
                return
            }

            do {
                let decoder = JSONDecoder()
                let teamResponse = try decoder.decode(TeamResponse.self, from: data)
                guard let team = teamResponse.response.first?.team else {
                    completion(nil, NSError(domain: "No team found", code: 4, userInfo: nil))
                    return
                }
                
                // Получаем название команды и URL логотипа
                let teamName = team.name
                let logoURL = team.logo
                
                // Загружаем данные логотипа
                self.downloadLogo(from: logoURL ?? "") { logoData, error in
                    if let error = error {
                        completion(nil, error)
                        return
                    }

                    // Создаем экземпляр TeamModelData с данными команды и логотипом
                    let teamModelData = TeamModelData(id: team.id, goals: nil, name: teamName, logo: logoData)
                    completion(teamModelData, nil)
                }
            } catch {
                completion(nil, error)
            }
        }

        task.resume()
    }

    // Функция для загрузки логотипа
    func downloadLogo(from url: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let logoURL = URL(string: url) else {
            completion(nil, NSError(domain: "Invalid logo URL", code: 1, userInfo: nil))
            return
        }

        let logoTask = URLSession.shared.dataTask(with: logoURL) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "No logo data received", code: 2, userInfo: nil))
                return
            }

            completion(data, nil)
        }

        logoTask.resume()
    }



    // Фильтрация матчей по статусу
    func filterMatches(_ matches: [LiveGame]) -> [LiveGame] {
        return matches.filter { match in
            return !match.status.stopped && !match.status.blocked && !match.status.finished
        }
    }
}
