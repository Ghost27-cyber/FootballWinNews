
import Foundation
import UIKit

extension UIFont {
    static func systemFontItalic(size fontSize: CGFloat = 17.0, fontWeight: UIFont.Weight) -> UIFont {
        let font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        return UIFont(descriptor: font.fontDescriptor.withSymbolicTraits([.traitItalic, .traitBold])!, size: fontSize)
      }
}

class LoadingView: UIView {
    
    private let loaderUpdater = UIView()
    
    private let logoView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "loaderBallImage")
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let sportNewsLabel: UILabel = {
       let label = UILabel()
        label.text = "SPORT NEWS"
        label.font = UIFont.systemFontItalic(size: 40, fontWeight: .bold)
        label.textColor = .white
        return label
    }()
    
    public var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .white
        progressView.layer.cornerRadius = 2
        progressView.layer.masksToBounds = true
        progressView.trackTintColor = .clear
        progressView.backgroundColor = .gray
        progressView.setProgress(0.0, animated: false)
        return progressView
    }()
    
    public let pleaseWaitLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.text = "Please, wait"
        return label
    }()
    
    private var timer: Timer?
    private var timerCounter: Float = 7
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = Resources.Colors.mainBackgroundColor
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        self.addSubview(logoView)
        self.addSubview(sportNewsLabel)
        self.addSubview(progressView)
        self.addSubview(pleaseWaitLabel)
    }
    
    private func setupConstraints() {
        logoView.snp.makeConstraints { make in
            make.size.equalTo(125)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(190)
        }
        
        sportNewsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoView.snp.bottom).offset(40)
        }
        
        progressView.snp.makeConstraints { make in
            make.width.equalTo(283)
            make.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-120)
        }
        
        pleaseWaitLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom).offset(30)
        }
    }
    
    
    public func setupLoading() {
        timerCounter = 7
        progressView.layoutIfNeeded()
        progressView.setProgress(0, animated: false)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            self.timerCounter += 0.2
            if self.timerCounter >= 3{
                timer.invalidate()
            }
            let progress = self.timerCounter
            self.progressView.setProgress(progress, animated: true)
        }
    }
}
