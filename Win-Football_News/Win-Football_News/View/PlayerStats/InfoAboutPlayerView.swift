
import Foundation
import UIKit

class InfoAboutPlayerView: UIView {
    
    let name: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    let overallRatingLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(red: 52/255, green: 144/255, blue: 244/255, alpha: 1.0)
        label.text = "Overall Rating"
        label.textAlignment = .center
        return label
    }()
    
    let ratingBackView: UIImageView = {
         let im = UIImageView()
         im.image = UIImage(named: "ratingBackView")
         im.contentMode = .scaleAspectFit
         return im
     }()
    
    let rating: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let shoBackView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    let sholabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .gray
        label.text = "SHO:"
        label.textAlignment = .center
        return label
    }()
    
    let sho: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let pasBackView: UIView = {
        let view = UIView()
         view.backgroundColor = .lightGray.withAlphaComponent(0.3)
         view.layer.cornerRadius = 12
         view.clipsToBounds = true
         return view
     }()
    
    let paslabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .gray
        label.text = "PAS:"
        label.textAlignment = .center
        return label
    }()
    
    let pas: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let text: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(name)
        addSubview(overallRatingLabel)
        addSubview(ratingBackView)
        addSubview(rating)
        addSubview(shoBackView)
        shoBackView.addSubview(sholabel)
        shoBackView.addSubview(sho)
        addSubview(pasBackView)
        pasBackView.addSubview(paslabel)
        pasBackView.addSubview(pas)
        addSubview(text)
    }
    
    private func setupConstraints() {
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        overallRatingLabel.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        ratingBackView.snp.makeConstraints { make in
            make.width.equalTo(51)
            make.height.equalTo(23)
            make.centerX.equalToSuperview()
            make.top.equalTo(overallRatingLabel.snp.bottom).offset(2)
        }
        
        rating.snp.makeConstraints { make in
            make.center.equalTo(ratingBackView.snp.center)
        }
        
        shoBackView.snp.makeConstraints { make in
            make.centerY.equalTo(ratingBackView.snp.centerY)
            make.width.equalTo(84)
            make.height.equalTo(25)
            make.leading.equalToSuperview().offset(39)
        }
        
        sholabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        sho.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
        
        pasBackView.snp.makeConstraints { make in
            make.centerY.equalTo(ratingBackView.snp.centerY)
            make.width.equalTo(84)
            make.height.equalTo(25)
            make.trailing.equalToSuperview().offset(-39)
        }
        
        paslabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        pas.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
        
        text.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().offset(-17)
            make.top.equalTo(ratingBackView.snp.bottom).offset(13)
        }
    }
}
