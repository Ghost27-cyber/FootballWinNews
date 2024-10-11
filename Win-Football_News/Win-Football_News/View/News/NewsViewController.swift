
import Foundation
import UIKit

class NewsViewController: UIViewController {
    
    let viewModel = NewsViewModel()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    
    let newsLabel: UILabel = {
       let label = UILabel()
        label.text = "NEWS"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    public let newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 28, height: 119)
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 32
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = Resources.Colors.mainBackgroundColor
        setupSubviews()
        setupConstraints()
        setupCollectionView()
        setupButton()
    }

    private func setupSubviews() {
        view.addSubview(backButton)
        view.addSubview(newsLabel)
        view.addSubview(newsCollectionView)
    }

    private func setupConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.size.equalTo(22)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(73)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(18)
        }
        
        newsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
    }
}
