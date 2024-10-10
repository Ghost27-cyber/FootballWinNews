
import Foundation
import UIKit

class LeagueCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "LeagueCollectionViewCell"
    
    let leagueImageView: UIImageView = {
        let im = UIImageView()
        im.backgroundColor = .clear
        im.contentMode = .scaleAspectFit
        return im
    }()

    var currentImageName = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(leagueImageView)
        leagueImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func setupCell(id: Int) {
        switch id {
        case 0:
            currentImageName = "premierLeague"
        case 1:
            currentImageName = "laLiga"
        case 2:
            currentImageName = "seriaA"
        default:
            currentImageName = "bundesliga"
        }
        
        leagueImageView.image = UIImage(named: currentImageName)
    }
    
    public func selectImage() {
        currentImageName += "Selected"
        leagueImageView.image = UIImage(named: currentImageName)
    }
    
    public func deselectImage() {
        if currentImageName.hasSuffix("Selected") {
            currentImageName = String(currentImageName.dropLast("Selected".count))
        }
        leagueImageView.image = UIImage(named: currentImageName)
    }

}
