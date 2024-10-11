
import Foundation
import UIKit

class LiveGameCollectionViewCell: UICollectionViewCell {
    static let reuseId = "LiveGameCollectionViewCell"
    
    let backView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let logoHome: UIImageView = {
       let im = UIImageView()
        im.contentMode = .scaleAspectFit
        
        return im
    }()
    
    let logoAway: UIImageView = {
       let im = UIImageView()
        im.contentMode = .scaleAspectFit
        
        return im
    }()
    
    let score: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let time: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        addSubview(backView)
        backView.addSubview(logoHome)
        backView.addSubview(logoAway)
        backView.addSubview(time)
        backView.addSubview(score)
        
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoHome.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(120)
            make.leading.equalToSuperview().offset(18)
        }
        
        logoAway.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(120)
            make.trailing.equalToSuperview().offset(-18)
        }
        
        time.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(27)
        }
        
        score.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    public func setupCell(match: LiveGame) {
        logoHome.image = UIImage(data: match.teams.home.logo ?? Data())
        logoAway.image = UIImage(data: match.teams.away.logo ?? Data())
        
        score.text = "\(match.teams.home.goals ?? 0)-\(match.teams.away.goals ?? 0)"
        if let minutes = match.fixture.status.seconds.split(separator: ":").first {
            let result = "\(minutes)'"
            time.text = result
        }
    }
}
