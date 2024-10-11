import Foundation

import Foundation

class FavouritesManager {
    static let shared = FavouritesManager()
    private var favourites: [(leagueId: Int, playerId: Int)] = []
    private let favouritesKey = "favourites"

    private init() {
        loadFavourites()
    }

    func addFavourite(leagueId: Int, playerId: Int) {
        let favourite = (leagueId: leagueId, playerId: playerId)
        favourites.append(favourite)
        saveFavourites()
    }

    func removeFavourite(leagueId: Int, playerId: Int) {
        favourites.removeAll { $0.leagueId == leagueId && $0.playerId == playerId }
        saveFavourites()
    }

    func isFavourite(leagueId: Int, playerId: Int) -> Bool {
        return favourites.contains { $0.leagueId == leagueId && $0.playerId == playerId }
    }

    func getFavourites() -> [(leagueId: Int, playerId: Int)] {
        return favourites
    }

    private func saveFavourites() {
        let savedFavourites = favourites.map { ["leagueId": $0.leagueId, "playerId": $0.playerId] }
        UserDefaults.standard.set(savedFavourites, forKey: favouritesKey)
    }

    private func loadFavourites() {
        if let savedFavourites = UserDefaults.standard.array(forKey: favouritesKey) as? [[String: Int]] {
            favourites = savedFavourites.compactMap {
                guard let leagueId = $0["leagueId"], let playerId = $0["playerId"] else { return nil }
                return (leagueId: leagueId, playerId: playerId)
            }
        }
    }
}
