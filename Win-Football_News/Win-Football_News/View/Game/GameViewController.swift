import UIKit
import SnapKit

protocol GameViewControllerDelegate: AnyObject {
    func reloadGame()
}
class GameViewController: UIViewController {
    
    private let gameView = GameView()
    private var backButton = UIButton()
    private var rightButton = UIButton()
    private var leftButton = UIButton()
    private var player = UIImageView()
    private var score = 0
    
    private var ballPosition = CGFloat()
    private var ballTimer: Timer?
    
    
    private let animationDuration: TimeInterval = 1.0
    private var startPoint = CGPoint()
    private var controlPoint = CGPoint()
    
    private var endPoint = CGPoint()
    
    public let gameisendview = GameIsEndView()
    
    weak var delegate: GameMenuViewController?

    var isEnd = false
    
    
    private var ball: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gameBall"), for: .normal)
        return button
        
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        configureBall()
    }

    
    private func configureBall() {
        view.addSubview(ball)
        ball.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.centerX.equalTo(player.snp.leading)
            //make.bottom.equalTo(player.snp.bottom).inset(80)
        }
        
        ballTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateBallPosition), userInfo: nil, repeats: true)
        // Начинаем получать данные с гироскопа
    }
    
    private func configure() {
        view.addSubview(gameView)
        gameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        startPoint = CGPoint(x: 100.0, y: 400.0)
        controlPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 100.0)
        
        endPoint = CGPoint(x: UIScreen.main.bounds.width - 100.0, y: 500)
        
        backButton = gameView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        rightButton = gameView.rightKickButton
        leftButton = gameView.leftKickButton
        player = gameView.playerImageView
        rightButton.addTarget(self, action: #selector(rightPressed), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftPressed), for: .touchUpInside)
        
        gameisendview.scoreLabel.text = "\(GameModel.shared.scoresInGame)"
        GameModel.shared.scoresInGame = 0
        
        gameisendview.menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        gameisendview.playAgainButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
        
    }
    
    @objc func menuPressed() {
        navigationController?.popViewController(animated: true)
    }
    @objc func playPressed() {
        navigationController?.popViewController(animated: false)
        delegate?.reloadGame()
    }
    

}
private extension GameViewController {
    @objc func updateBallPosition() {
        // Обновляем позицию мяча по вертикали (смещение падения)
        ball.center.y += 10
        // Проверяем столкновение мяча с футболистом
        if ball.frame.intersects(player.frame) {
            // Логика отбивания мяча
            // Увеличиваем счет игрока
        }
        // Проверка падения мяча на газон
        if Int(ball.frame.origin.y) >= Int(player.frame.maxY)  {
            ballTimer?.invalidate()
            ballTimer = nil
            ball.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(Int(player.frame.maxY))
            }
            if isEnd == false {
                isEnd = true
                //MARK: Переход на экран проигрыша
                view.addSubview(gameisendview)
                gameisendview.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
                gameisendview.scoreLabel.text = "\(GameModel.shared.scoresInGame)"
                saveResult()
                GameModel.shared.scoresInGame = 0
            }
        }
    }
    
    private func saveResult() {
        let score = GameModel.shared.scoresInGame
        let name = GameModel.shared.player.name
        let imageName = GameModel.shared.player.imageName
        let statsModel = StatsModel(name: name, scores: score, imageName: imageName)
        
        StatsManager.shared.addNewStat(statsModel)
    }


}


private extension GameViewController {
    @objc func rightPressed() {
        if ((ballTimer?.isValid) != nil) {
            player.image = UIImage(named: GameModel.shared.currentPlayer+"Right1")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                // Установите второе изображение
                self.player.image = UIImage(named: GameModel.shared.currentPlayer+"Right2")
            }
            
            if abs((player.frame.maxY-80)-ball.frame.minY) <= 70 {
                print("Ок")
                ballTimer?.invalidate()
                
                GameModel.shared.scores += 1
                GameModel.shared.scoresInGame += 1
                gameView.scoreLabel.text = "\(GameModel.shared.scoresInGame)"
                startPoint.y = ball.center.y + 20
                startPoint.x = 300
                print(ball.center.y, ball.center.y)
                
                
                endPoint.x = 100
                endPoint.y = ball.frame.minY + 100
                ball.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(Int(ball.frame.minY))
                }
                print("dfgwedfg")
                kick()
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                // Установите второе изображение
                self.player.image = UIImage(named: GameModel.shared.currentPlayer+"Right1")
                self.ballTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.updateBallPosition), userInfo: nil, repeats: true)
            }
        }
    }
    
    @objc func leftPressed() {
        if ((ballTimer?.isValid) != nil) {
            player.image = UIImage(named: GameModel.shared.currentPlayer+"Left1")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                // Установите второе изображение
                self.player.image = UIImage(named: GameModel.shared.currentPlayer+"Left2")
            }
            if abs((player.frame.maxY-80)-ball.frame.minY) <= 70 {
                ballTimer?.invalidate()
                
                GameModel.shared.scores += 1
                GameModel.shared.scoresInGame += 1
                gameView.scoreLabel.text = "\(GameModel.shared.scoresInGame)"
                
                startPoint.y = ball.center.y + 20
                startPoint.x = 100
                
                endPoint.x = 300
                endPoint.y = ball.frame.minY + 100
                ball.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(Int(ball.frame.minY))
                }
                
                kick()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                // Установите второе изображение
                self.player.image = UIImage(named: GameModel.shared.currentPlayer+"Left1")
                self.ballTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.updateBallPosition), userInfo: nil, repeats: true)
            }
        }
    }
    
    private func kick() {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = createBezierPath().cgPath
        animation.duration = animationDuration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        ball.layer.add(animation, forKey: "positionAnimation")
        //MARK: Логика добавления очков
        print("отбил")
    }
    
    private func createBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        return path
    }
}
private extension GameViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
