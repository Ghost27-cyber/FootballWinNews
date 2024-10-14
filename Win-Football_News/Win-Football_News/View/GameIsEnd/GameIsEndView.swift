import UIKit

class GameIsEndView: UIView {
    
    private let background = UIImageView(image: UIImage(named: "gameIsOverBack"))
    private let ballIsLoose = UIImageView(image: UIImage(named: "theBallIsLost"))
    
    public var playAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Restart", for: .normal)
        button.backgroundColor = Resources.Colors.darkBlueColor
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.systemFont(ofSize: 48)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let scoreView = UIImageView(image: UIImage(named: "scoreView"))
    
    public var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 80, weight: .semibold)
        label.text = "050"
        label.textColor = .white
        return label
    }()
    
    public var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Menu", for: .normal)
        button.backgroundColor = Resources.Colors.darkBlueColor
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.systemFont(ofSize: 29)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public let person = UIImageView(image: UIImage(named: GameModel.shared.currentPlayer + "Left2"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(background)
        addSubview(person)
        addSubview(ballIsLoose)
        addSubview(playAgainButton)
        addSubview(menuButton)
        addSubview(scoreView)
        scoreView.addSubview(scoreLabel)
        
        ballIsLoose.contentMode = .scaleAspectFit
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        person.contentMode = .scaleAspectFit
        person.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(612)
            make.top.equalTo(snp.centerY)
            make.leading.equalToSuperview().offset(110)
        }
        
        ballIsLoose.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
            make.height.equalTo(27)
            make.top.equalToSuperview().offset(60)
        }
        scoreView.contentMode = .scaleAspectFit
        scoreView.snp.makeConstraints { make in
            make.top.equalTo(ballIsLoose.snp.bottom).offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(257)
            make.height.equalTo(116)
        }
        scoreLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        playAgainButton.snp.makeConstraints { make in
            make.width.equalTo(219)
            make.height.equalTo(69)
            make.top.equalTo(scoreView.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints { make in
            make.width.equalTo(133)
            make.height.equalTo(42)
            make.top.equalTo(playAgainButton.snp.bottom).offset(39)
            make.centerX.equalToSuperview()
        }
    }
    

}
