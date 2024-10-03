import Foundation
enum LeagueIds: String, CaseIterable {
    case premierLeague = "PL"
    case serieA = "SA"
    case bundesliga = "BL1"
    case laLiga = "PD"
    case championsLeague = "CL"
}



class MainViewModel {
    
    weak var delegate: MainViewController?
    
    private var matchesManager: MatchesManager?
    private var apiCaller = APICaller.shared
    
    var matches: [Match] = []
    
    init() {
        self.matchesManager = MatchesManager(completion: { result in
            switch result {
            case .success():
                self.getNextTwentyMatches(sortedBy: .ascending) {
                    print("matches loaded")
                    if self.matches.count != 20 {
                        print("Error")
                    } else {
                        self.matchesLoaded()
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.showError(str: error.localizedDescription)
                }
            }
        })
    }
    
    private func matchesLoaded() {
        DispatchQueue.main.async {
            self.delegate?.matchesLoaded()
        }
    }
    
    public func reloadData(completion: @escaping () -> Void) {
        matchesManager?.resetCurrentPage()
        matchesManager?.reloadMatches { [weak self] result in
            switch result {
            case .success:
                self?.getNextTwentyMatches(sortedBy: .ascending) {
                    print("Data reloaded successfully")
                    self?.matchesLoaded()
                    completion()
                }
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    
    public func getNextTwentyMatches(sortedBy sortOrder: MatchSortOrder, completion: @escaping () -> Void) {
        matchesManager?.loadMoreMatches(sortedBy: sortOrder) { [weak self] result in
            switch result {
            case .success(let loadedMatches):
                self?.matches = loadedMatches
                completion()
            case .failure(let error):
                self?.handleError(error)
                completion()
            }
        }
    }

    public func getNextTwentyMatchesWith(leagueId: String, sortedBy sortOrder: MatchSortOrder, completion: @escaping () -> Void) {
        matchesManager?.loadMoreMatchesFrom(leagueId: leagueId, sortedBy: sortOrder) { [weak self] result in
            switch result {
            case .success(let loadedMatches):
                self?.matches = loadedMatches
                completion()
            case .failure(let error):
                self?.handleError(error)
                completion()
            }
        }
    }
    
    public func getMatch(by index: Int) -> Match? {
        guard index >= 0 && index < matches.count else { return nil }
        return matches[index]
    }
    
    private func handleError(_ error: Error) {
        DispatchQueue.main.async {
            self.delegate?.showError(message: "Failed to load data: \(error.localizedDescription)")
        }
    }
    
    func extractTime(from dateTimeString: String) -> String? {
        DateHelper.shared.extractTime(from: dateTimeString)
    }
    

    func formatDate(_ dateTimeString: String) -> String? {
        DateHelper.shared.formatDate(dateTimeString)
    }

}
