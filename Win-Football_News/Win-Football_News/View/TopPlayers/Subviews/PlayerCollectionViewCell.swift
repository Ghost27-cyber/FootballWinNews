
import Foundation
import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PlayerCollectionViewCell"
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let playerid: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let playerPhoto: UIImageView = {
       let im = UIImageView()
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
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
        view.backgroundColor = .lightGray
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
         view.backgroundColor = .lightGray
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        congigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func congigure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        self.addSubview(backView)
        self.addSubview(playerid)
        self.addSubview(playerPhoto)
        self.addSubview(name)
        self.addSubview(overallRatingLabel)
        self.addSubview(ratingBackView)
        self.addSubview(rating)
        self.addSubview(shoBackView)
        shoBackView.addSubview(sholabel)
        shoBackView.addSubview(sho)
        self.addSubview(pasBackView)
        pasBackView.addSubview(paslabel)
        pasBackView.addSubview(pas)
    }
    
    private func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        playerid.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(9)
        }
        
        playerPhoto.snp.makeConstraints { make in
            make.size.equalTo(63)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(39)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(playerPhoto.snp.trailing).offset(17)
        }
        
        overallRatingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.leading.equalTo(name.snp.leading)
        }
        
        ratingBackView.snp.makeConstraints { make in
            make.width.equalTo(51)
            make.height.equalTo(23)
            make.leading.equalTo(name.snp.leading)
            make.bottom.equalToSuperview().offset(-6)
        }
        
        rating.snp.makeConstraints { make in
            make.center.equalTo(ratingBackView.snp.center)
        }
        
        shoBackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(84)
            make.height.equalTo(25)
            make.trailing.equalToSuperview().offset(-40)
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
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(84)
            make.height.equalTo(25)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        paslabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        pas.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    
    public func setupCell(player: Player) {
        name.text = player.name
        rating.text = player.rating
        sho.text = player.sho
        pas.text = player.pas
        
        playerid.text = String(player.id)
        playerPhoto.image = UIImage(named: player.imageName)
    }
}
