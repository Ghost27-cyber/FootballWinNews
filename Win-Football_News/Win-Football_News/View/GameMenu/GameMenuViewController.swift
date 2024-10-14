
import Foundation
import UIKit

class GameMenuViewController: UIViewController, GameViewControllerDelegate {
    
    let gameView = GameMenuView()
    
    var selectPlayerView = SelectPlayerView()
    var viewModel = FavouritesViewModel()
    
    var isFirstLoad = true
    
    override func loadView() {
        super.loadView()
        showSelectionTable()
        selectPlayerView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    func showSelectionTable()  {
        view.addSubview(selectPlayerView)
        selectPlayerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        setupCollectionView()
    }
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
    
    public func setupUI() {
        isFirstLoad = false
        view.addSubview(gameView)
        
        gameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gameView.playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
        gameView.exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
        gameView.favouritesButton.addTarget(self, action: #selector(favouritesPressed), for: .touchUpInside)
        gameView.statisticButton.addTarget(self, action: #selector(statsPressed), for: .touchUpInside)
    }
    
    @objc
    func statsPressed() {
        let vc = StatsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func backPressed() {
        if isFirstLoad == false {
            selectPlayerView.removeFromSuperview()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    func playPressed() {
        let vc = GameViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    } 
    
    @objc
    func favouritesPressed() {
        showSelectionTable()
    }
    
    @objc
    func exitPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func reloadGame() {
        let vc = GameViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
