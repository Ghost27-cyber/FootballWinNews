//
//  SoccerView.swift
//  Win-Football_News
//
//  Created by Kirill Manuilenko on 7.10.24.
//

import UIKit
import WebKit

class SoccerView: UIViewController, WKNavigationDelegate, WKUIDelegate {
    var goalView: WKWebView!
    var soccer: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        let wkPreferences = WKPreferences()
        wkPreferences.javaScriptCanOpenWindowsAutomatically = true

        let configuration = WKWebViewConfiguration()
        configuration.preferences = wkPreferences

        goalView = WKWebView(frame: self.view.frame, configuration: configuration)
        goalView.navigationDelegate = self
        goalView.uiDelegate = self
        self.view.addSubview(goalView)

        let request = URLRequest(url: soccer)
        goalView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let currentURL = webView.url {
            print("Finished loading URL: \(currentURL)")
            UserDefaults.standard.set(currentURL, forKey: "newsURL")
        }
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        let newWebView = WKWebView(frame: self.goalView.bounds, configuration: configuration)
        newWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newWebView.navigationDelegate = self
        newWebView.uiDelegate = self
        webView.addSubview(newWebView)

        let viewController = WebViewController()
        viewController.webView = newWebView

        UIApplication.topViewController()?.present(viewController, animated: true)

        return newWebView
    }

    func webViewDidClose(_ webView: WKWebView) {
        self.dismiss(animated: true)
    }
}

class WebViewController: UIViewController {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()


        webView.translatesAutoresizingMaskIntoConstraints = false


        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

