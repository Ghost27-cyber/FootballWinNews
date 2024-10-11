
import Foundation
import UIKit

class FavouritesViewController: UIViewController {
    
    var viewModel = FavouritesViewModel()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    let favouritesTitle: UILabel = {
       let label = UILabel()
        label.text = "FAVOURITES"
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
        configure()
    }
    
    private func configure() {
        self.view.backgroundColor = Resources.Colors.mainBackgroundColor
        setupUI()
        setupCollectionView()
        setupButton()
    }
    
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(favouritesTitle)
        view.addSubview(favouritesCollectionView)
        backButton.snp.makeConstraints { make in
            make.size.equalTo(22)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(73)
        }
        
        favouritesTitle.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(18)
        }
        
        favouritesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
    }
}
