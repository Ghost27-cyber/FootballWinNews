import Foundation

struct StatsModel: Codable {
    let name: String
    let scores: Int
    let imageName: String
}

class StatsManager {
    
    static let shared = StatsManager()
    
    private init() {}
    
    private let topStatsKey = "topStats"
    
    private let maxTopStats = 5
    
    func loadTopStats() -> [StatsModel] {
        guard let data = UserDefaults.standard.data(forKey: topStatsKey) else {
            return []
        }
        let decoder = JSONDecoder()
        do {
            let topStats = try decoder.decode([StatsModel].self, from: data)
            return topStats
        } catch {
            print("Ошибка при декодировании данных: \(error)")
            return []
        }
    }
    
    private func saveTopStats(_ stats: [StatsModel]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(stats)
            UserDefaults.standard.set(data, forKey: topStatsKey)
        } catch {
            print("Ошибка при кодировании данных: \(error)")
        }
    }
    
    func addNewStat(_ newStat: StatsModel) {
        var topStats = loadTopStats()
        
        topStats.append(newStat)
        topStats.sort { $0.scores > $1.scores }
        
        if topStats.count > maxTopStats {
            topStats = Array(topStats.prefix(maxTopStats))
        }
        
        saveTopStats(topStats)
    }
    
    func getTopStats() -> [StatsModel] {
        return loadTopStats()
    }
    
    func clearTopStats() {
        UserDefaults.standard.removeObject(forKey: topStatsKey)
    }
}
