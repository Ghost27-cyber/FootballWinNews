import Foundation

class FavouritesViewModel {
    
    let playersArray = PlayersFetcher.shared.playersArray
    
    private var favourites: [(leagueId: Int, playerId: Int)] {
        return FavouritesManager.shared.getFavourites()
    }
    
    var favouritesCount: Int {
        return favourites.count
    }
    
    func getPlayerIds(at index: Int) -> Player? {
        guard index < favourites.count else { return nil }
        let leagueId = favourites[index].leagueId
        let playerId = favourites[index].playerId
        
        let league = playersArray[leagueId]
        let player = league.players.first(where: {$0.id == playerId})
        
        return player
    }
}

