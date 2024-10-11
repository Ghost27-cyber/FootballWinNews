
import Foundation
import UIKit

protocol LiveGamesViewControllerDelegate: AnyObject {
    func loadUI()
    
}

class LiveGamesViewController: UIViewController, LiveGamesViewControllerDelegate {
    
    var isFirstLoad = true
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    let liveGamesTitle: UILabel = {
       let label = UILabel()
        label.text = "LIVE GAMES"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let liveGamesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 152)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    let noLiveMatchesNow: UILabel = {
       let label = UILabel()
        label.text = "There are currently no live matches"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    var viewModel: LiveGameViewModel!
    var activityIndicator: UIActivityIndicatorView!
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = Resources.Colors.mainBackgroundColor
        activityIndicator = UIActivityIndicatorView()
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.startAnimating()
        viewModel = LiveGameViewModel()
        viewModel.delegate = self
    }
    private func configure() {
        isFirstLoad = false
        setupUI()
        setupCollectionView()
        setupButton()
    }
    
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(liveGamesTitle)
        view.addSubview(liveGamesCollectionView)
        view.addSubview(noLiveMatchesNow)
        backButton.snp.makeConstraints { make in
            make.size.equalTo(22)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(73)
        }
        
        liveGamesTitle.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(18)
        }
        
        liveGamesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
        noLiveMatchesNow.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func loadUI() {
        if viewModel.getCountGames() == 0 {
            noLiveMatchesNow.isHidden = false
        } else {
            noLiveMatchesNow.isHidden = true
        }
        if isFirstLoad {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            configure()
        }
        reloadCollection()
    }
}
