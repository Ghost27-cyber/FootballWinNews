
import Foundation
import UIKit


class NewsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "NewsCollectionViewCell"
    
    let backview: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.clipsToBounds = true // Обязательно для работы с маской
        
        return im
    }()
    
    let newsTitleLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    
    
    
    private let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    private func setupSubviews() {
        addSubview(backview)
        backview.addSubview(imageView)
        backview.addSubview(newsTitleLabel)
        backview.addSubview(infoLabel)
    }
    
    private func setupConstraints() {
        backview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalTo(140)
            make.top.equalToSuperview().offset(-3)
            make.bottom.equalToSuperview().offset(3)
        }
        
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-1)
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.leading.equalTo(newsTitleLabel.snp.leading)
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(1)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-5)
        }
        
//        separatorLineView.snp.makeConstraints { make in
//            make.top.equalTo(contentView.snp.bottom).offset(15.35)
//            make.width.equalTo(contentView.bounds.width - 68)
//            make.height.equalTo(1.3)
//            make.centerX.equalToSuperview()
//        }
        backview.layer.cornerRadius = 20
        backview.clipsToBounds = true
    }
    
    func setupCell(_ news: NewsModel) {
        imageView.image = UIImage(named: news.imageName)
        newsTitleLabel.text = news.title
        infoLabel.text = news.text
    }
}

