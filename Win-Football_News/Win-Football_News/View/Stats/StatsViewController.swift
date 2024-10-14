
import UIKit
import Foundation


class StatsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private let background = UIImageView(image: UIImage(named: "gameBackview2"))
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    let favouritesTitle: UILabel = {
       let label = UILabel()
        label.text = "STATISTIC"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let favouritesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 71)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(StatsManager.shared.getTopStats())
        configure()
    }
    
    private func configure() {
        setupCollectionView()
        setupUI()
        
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc
    func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        view.addSubview(background)
        view.addSubview(backButton)
        view.addSubview(favouritesTitle)
        view.addSubview(favouritesCollectionView)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.size.equalTo(22)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(73)
        }
        
        favouritesTitle.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.centerX.equalToSuperview()
        }
        
        favouritesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupCollectionView() {
        favouritesCollectionView.dataSource = self
        favouritesCollectionView.delegate = self
        
        favouritesCollectionView.register(StatsCollectionViewCell.self, forCellWithReuseIdentifier: StatsCollectionViewCell.reuseId)
    
   }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StatsManager.shared.getTopStats().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatsCollectionViewCell.reuseId, for: indexPath) as? StatsCollectionViewCell else {
            fatalError("Unable to dequeue PlayerCollectionViewCell")
//                return UICollectionViewCell()
        }
        
        let player = StatsManager.shared.getTopStats()[indexPath.row]
        
        cell.setupCell(id: indexPath.row + 1, nameStr: player.name, scoresInt: player.scores, imageName: player.imageName)
        return cell
        
    }
    
}
