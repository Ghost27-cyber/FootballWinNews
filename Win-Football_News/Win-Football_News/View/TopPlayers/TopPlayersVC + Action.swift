
import Foundation
import UIKit

extension TopPlayersViewController {
    func setupButton() {
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc
    func backPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}
