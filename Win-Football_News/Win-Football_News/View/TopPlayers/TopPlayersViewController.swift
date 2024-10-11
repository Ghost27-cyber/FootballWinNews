
import Foundation
import UIKit


class TopPlayersViewController: UIViewController {
    
    var viewModel = TopPlayersViewModel()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    var currentleague = LeagueIds.premierLeague
    
    let topPlayersTitle: UILabel = {
       let label = UILabel()
        label.text = "TOP PLAYERS"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let leaguesLabel: UILabel = {
       let label = UILabel()
        label.text = "LEAGUES"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    let playersLabel: UILabel = {
       let label = UILabel()
        label.text = "PLAYERS"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    let leaguesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 161, height: 152)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    let topPlayersCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 71)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var isFirstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    
    private func configure() {
        setupUI()
        setupCollectionView()
        setupButton()
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.mainBackgroundColor
        view.addSubview(backButton)
        view.addSubview(topPlayersTitle)
        view.addSubview(leaguesCollectionView)
        view.addSubview(leaguesLabel)
        view.addSubview(topPlayersCollectionView)
        view.addSubview(playersLabel)
        
        backButton.snp.makeConstraints { make in
            make.size.equalTo(22)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(73)
        }
        
        topPlayersTitle.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(18)
        }
        
        leaguesLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(33)
            make.leading.equalToSuperview().offset(16)
        }
        
        leaguesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(leaguesLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(152)
        }
        
        playersLabel.snp.makeConstraints { make in
            make.top.equalTo(leaguesCollectionView.snp.bottom).offset(34)
            make.leading.equalToSuperview().offset(16)
        }
        
        topPlayersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(playersLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
    
    
}
