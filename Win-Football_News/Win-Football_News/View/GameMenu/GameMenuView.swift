
import Foundation
import UIKit

class GameMenuView: UIView {
    
    let backview: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gameBackview")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let playButton: UIButton = {
       let button = UIButton()
        button.setTitle("PLAY", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 48)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Resources.Colors.darkBlueColor
        button.layer.cornerRadius = 16
        return button
    }()
    
    let statisticButton: UIButton = {
       let button = UIButton()
        button.setTitle("Statistic", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Resources.Colors.darkBlueColor
        button.layer.cornerRadius = 16
        return button
    }()
    
    let favouritesButton: UIButton = {
       let button = UIButton()
        button.setTitle("Change Player", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Resources.Colors.darkBlueColor
        button.layer.cornerRadius = 16
        return button
    }()
    
    let exitButton: UIButton = {
       let button = UIButton()
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Resources.Colors.darkBlueColor
        button.layer.cornerRadius = 16
        return button
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
    
    private func setupSubviews() {
        addSubview(backview)
        addSubview(playButton)
        addSubview(statisticButton)
        addSubview(favouritesButton)
        addSubview(exitButton)
    }
    
    private func setupConstraints() {
        backview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        playButton.snp.makeConstraints { make in
            make.width.equalTo(219)
            make.height.equalTo(69)
            make.trailing.equalToSuperview().offset(-17)
            make.bottom.equalToSuperview().offset(-401)
        }
        
        statisticButton.snp.makeConstraints { make in
            make.width.equalTo(209)
            make.height.equalTo(47)
            make.trailing.equalToSuperview().offset(-65)
            make.bottom.equalToSuperview().offset(-267)
        }
        
        favouritesButton.snp.makeConstraints { make in
            make.width.equalTo(209)
            make.height.equalTo(47)
            make.trailing.equalToSuperview().offset(-126)
            make.bottom.equalToSuperview().offset(-166)
        }
        
        exitButton.snp.makeConstraints { make in
            make.width.equalTo(209)
            make.height.equalTo(47)
            make.trailing.equalToSuperview().offset(-65)
            make.bottom.equalToSuperview().offset(-73)
        }
    }
}
