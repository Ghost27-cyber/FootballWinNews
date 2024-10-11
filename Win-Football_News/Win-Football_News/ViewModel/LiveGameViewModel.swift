
import Foundation

class LiveGameViewModel {

    weak var delegate: LiveGamesViewControllerDelegate?
    
    private var liveGames: [LiveGame] = []
    private var timer: Timer?

    init() {
        fetchAndUpdateLiveGames()  // Первый раз загружаем данные
        startUpdateTimer()         // Инициализируем таймер для обновления каждые 10 минут
    }

    /// Метод для загрузки данных с сервера
    private func fetchAndUpdateLiveGames() {
        LiveGamesFetcher.shared.fetchLiveGamesFromMultipleLeagues { liveGamesArray, error in
            if let error = error {
                print("Ошибка при загрузке данных: \(error)")
                self.liveGames = []
            } else if let liveGamesArray = liveGamesArray {
                self.liveGames = liveGamesArray
            } else {
                self.liveGames = []
            }
            self.loadUI()  // После загрузки данных обновляем UI
        }
    }

    /// Метод запуска таймера на обновление данных каждые 10 минут
    func startUpdateTimer() {
        timer?.invalidate()  // Останавливаем старый таймер, если он был запущен
        timer = Timer.scheduledTimer(timeInterval: 600, target: self, selector: #selector(updateLiveGames), userInfo: nil, repeats: true)
    }

    /// Метод, который срабатывает по таймеру для обновления данных
    @objc private func updateLiveGames() {
        fetchAndUpdateLiveGames()  // Загружаем новые данные
    }

    /// Метод для уведомления контроллера об обновлении данных
    func loadUI() {
        DispatchQueue.main.async {
            self.delegate?.loadUI()  // Уведомляем делегата о необходимости обновления UI
        }
    }

    func getCountGames() -> Int {
        return liveGames.count
    }

    func getLiveGame(by id: Int) -> LiveGame {
        return liveGames[id]
    }
}
