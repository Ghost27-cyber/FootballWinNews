
import Foundation
import UIKit

class PlayerStatsViewController: UIViewController {
    
    
    var player: Player!
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.backButton), for: .normal)
        return button
    }()
    
    
    let playerStatsLabel: UILabel = {
       let label = UILabel()
        label.text = "PLAYER STATS"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let playerPhoto: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let baseinfoView = BaseInfoView()
    
    let allInfoView = InfoAboutPlayerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupData()
        setupUI()
        setupSubviews()
        setupConstraints()
        setupButton()
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.mainBackgroundColor
    }
    
    private func setupSubviews() {
        view.addSubview(backButton)
        view.addSubview(playerStatsLabel)
        view.addSubview(playerPhoto)
        view.addSubview(baseinfoView)
        view.addSubview(allInfoView)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.size.equalTo(22)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(73)
        }
        
        playerStatsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(18)
        }
        
        playerPhoto.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(100)
            make.top.equalTo(backButton.snp.bottom).offset(30)
        }
        
        baseinfoView.snp.makeConstraints { make in
            make.centerY.equalTo(playerPhoto.snp.centerY)
            make.leading.equalTo(playerPhoto.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        allInfoView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(playerPhoto.snp.bottom).offset(30)
            make.height.equalTo(500)
        }
    }
    
    private func setupData() {
        playerPhoto.image = UIImage(named: player.imageName)
        
        baseinfoView.team.text = player.team
        baseinfoView.nationality.text = player.country
        
        allInfoView.pas.text = player.pas
        allInfoView.sho.text = player.sho
        allInfoView.rating.text = player.rating
        allInfoView.text.text = player.text
        allInfoView.name.text = player.name
    }
}
