
import Foundation
import UIKit

class SelectPlayerView: UIView {
    
    private let background = UIImageView(image: UIImage(named: "gameBackview2"))
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    let favouritesTitle: UILabel = {
       let label = UILabel()
        label.text = "SELECT YOUR PLAYER"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let pleaseAdd: UILabel = {
        let label = UILabel()
         label.text = "PLEASE SELECT FAVOURITE PLAYERS \nFROM TOP PLAYERS"
        label.numberOfLines = 0
        label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         label.textColor = .red
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupUI()
        
    }
    
    private func setupUI() {
        addSubview(background)
        addSubview(backButton)
        addSubview(favouritesTitle)
        addSubview(favouritesCollectionView)
        addSubview(pleaseAdd)
        pleaseAdd.isHidden = true
        pleaseAdd.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
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
}
