
import Foundation
import UIKit

class BaseInfoView: UIView {
    
    let backView: UIImageView = {
       let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "baseInfo")
        return im
    }()
    
    private let nationalityLabel: UILabel = {
       let label = UILabel()
        label.text = "Nationality"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    private let teamLabel: UILabel = {
       let label = UILabel()
        label.text = "Team"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    let nationality: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let team: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
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
        self.backgroundColor = .clear
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(backView)
        addSubview(nationalityLabel)
        addSubview(nationality)
        addSubview(teamLabel)
        addSubview(team)
    }
    
    private func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        nationalityLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(17)
            make.top.equalToSuperview().offset(12.5)
        }
        
        nationality.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12.5)
            make.leading.equalTo(nationalityLabel.snp.trailing).offset(6)
        }
        
        teamLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-12.5)
            make.leading.equalToSuperview().offset(17)
        }
        
        team.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-12.5)
            make.leading.equalTo(teamLabel.snp.trailing).offset(6)
        }
    }
}
