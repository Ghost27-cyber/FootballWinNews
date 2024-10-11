
import UIKit
import WebKit
import FirebaseCore
import FirebaseRemoteConfig
import FirebaseRemoteConfigInternal

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var goalData: RemoteConfig?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        FirebaseApp.configure()
        goalData = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        goalData?.configSettings = settings
        showFootballNews()
        start()
    }

    func start() {
        let nc = UINavigationController(rootViewController: MainViewController())
//        let nc = UINavigationController(rootViewController: FavouritesViewController())
        nc.navigationBar.isHidden = true
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }

}

extension SceneDelegate {

    private func showFootballNews() {
        fetchGeoLocation { [weak self] isRussianUser in
            guard isRussianUser else {
                DispatchQueue.main.async {
                    self?.start()
                }
                return
            }
            
            if let savedURL = UserDefaults.standard.url(forKey: "goal") {
                DispatchQueue.main.async {
                    let newsVC = SoccerView()
                    newsVC.soccer = savedURL
                    self?.window?.rootViewController = newsVC
                }
            } else {
                self?.goalSoccer { url in
                    DispatchQueue.main.async {
                        if let url = url {
                            UserDefaults.standard.set(url, forKey: "goal")
                            let newsVC = SoccerView()
                            newsVC.soccer = url
                            self?.window?.rootViewController = newsVC
                        } else {
                            self?.start()
                        }
                    }
                }
            }
        }
    }

    private func goalSoccer(completion: @escaping (URL?) -> Void) {
        goalData?.fetchAndActivate { [weak self] status, error in
            DispatchQueue.main.async {
                if error != nil {
                    completion(nil)
                    return
                }
                let urlString = self?.goalData?["goal"].stringValue
                if let url = URL(string: urlString ?? "") {
                    completion(url)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    private func fetchGeoLocation(completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://ipapi.co/json/")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(false) // Assume false if there's an error
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let countryCode = json["country_code"] as? String {
                    // Check if the country code is "RU" (Russia)
                    completion(countryCode == "RU")
                } else {
                    completion(false)
                }
            } catch {
                completion(false)
            }
        }
        task.resume()
    }
}
