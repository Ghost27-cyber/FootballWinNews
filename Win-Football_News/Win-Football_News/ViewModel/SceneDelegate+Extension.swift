//
//  SceneDelegate+Extension.swift
//  Win-Football_News
//
//  Created by Kirill Manuilenko on 7.10.24.
//

import Foundation

extension SceneDelegate {

    private func showFootballNews() {
        fetchGeoLocation { [weak self] isRussianUser in
            guard isRussianUser else {
                DispatchQueue.main.async {
                    self?.start() // Ensure the UI is updated on the main thread
                }
                return
            }
            
            if let savedURL = UserDefaults.standard.url(forKey: "lastVisitedURL") {
                DispatchQueue.main.async {
                    let newsVC = SoccerView()
                    newsVC.soccer = savedURL
                    self?.window?.rootViewController = newsVC
                }
            } else {
                self?.goalSoccer { url in
                    DispatchQueue.main.async {
                        if let url = url {
                            UserDefaults.standard.set(url, forKey: "lastVisitedURL")
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
                let urlString = self?.goalData?["remoteData"].stringValue
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
