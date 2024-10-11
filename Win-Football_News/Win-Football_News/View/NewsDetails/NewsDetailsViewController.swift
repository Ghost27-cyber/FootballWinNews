
import Foundation
import UIKit

class NewsDetailsViewController: UIViewController {
    
    var news: NewsModel!
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    
    let newsLabel: UILabel = {
       let label = UILabel()
        label.text = "NEWS DETAILS"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let backview: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        im.clipsToBounds = true // Обязательно для работы с маской
        
        return im
    }()
    
    let newsTitleLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Resources.Colors.mainBackgroundColor
        configure()
    }
    
    private func configure() {
        setupInfo()
        setupSubviews()
        setupConstraints()
        setupButton()
    }
    
    private func setupSubviews() {
        view.addSubview(backButton)
        view.addSubview(newsLabel)
        view.addSubview(backview)
        backview.addSubview(imageView)
        backview.addSubview(newsTitleLabel)
        backview.addSubview(infoLabel)
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
        
        backview.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(infoLabel.snp.bottom).offset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(207)
        }
        
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        backview.layer.cornerRadius = 20
        backview.clipsToBounds = true
    }
    
    private func setupInfo() {
        newsTitleLabel.text = news.title
        imageView.image = UIImage(named: news.imageName)
        infoLabel.text = news.text
    }
}
