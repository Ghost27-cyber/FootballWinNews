//
//  UIApplication+Extension.swift
//  Win-Football_News
//
//  Created by Kirill Manuilenko on 7.10.24.
//

import Foundation
import UIKit

extension UIApplication {
    static var keyWindow: UIWindow {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last!
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.keyWindow.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
