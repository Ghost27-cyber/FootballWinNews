
import Foundation

struct Player {
    let id: Int
    let name: String
    let team: String
    let rating: String
    let sho: String
    let pas: String
    let text: String
    let imageName: String
    let country: String
    let league: LeagueIds
}

struct TopFivePlayers {
    let players: [Player]
    let league: LeagueIds
}

class TopPlayersViewModel {
    
    let playersArray = PlayersFetcher.shared.playersArray
    
    public func getCountleagues() -> Int {
        return playersArray.count
    }
    
    public func getPlayerFrom(league: LeagueIds, playerId: Int) -> Player? {
        return playersArray
            .first(where: { $0.league == league })?
            .players.first(where: { $0.id == playerId })
    }

}
