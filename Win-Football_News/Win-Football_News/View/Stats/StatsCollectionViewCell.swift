//
//  StatsCollectionViewCell.swift
//  Win-Football_News
//
//  Created by Александр Андреев on 14.10.2024.
//

import Foundation
import UIKit

class StatsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "StatsCollectionViewCell"
    
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
    
    let scoresLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(red: 52/255, green: 144/255, blue: 244/255, alpha: 1.0)
        label.text = "Scores: "
        label.textAlignment = .center
        return label
    }()
    
    let scoresBackView: UIImageView = {
         let im = UIImageView()
         im.image = UIImage(named: "ratingBackView")
         im.contentMode = .scaleAspectFit
         return im
     }()
    
    let scores: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
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
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(playerid)
        
        playerid.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(13)
        }
        
        addSubview(playerPhoto)
        
        playerPhoto.snp.makeConstraints { make in
            make.size.equalTo(63)
            make.centerY.equalToSuperview()
            make.leading.equalTo(playerid.snp.trailing).offset(10)
        }
        
        addSubview(name)
        name.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(playerPhoto.snp.trailing).offset(16)
        }
        
        addSubview(scoresBackView)
        scoresBackView.snp.makeConstraints { make in
            make.width.equalTo(51)
            make.height.equalTo(23)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-21)
        }
        
        scoresBackView.addSubview(scores)
        scores.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(scoresLabel)
        scoresLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(scoresBackView.snp.leading).offset(-10)
        }
    }
    
    public func setupCell(id: Int, nameStr: String, scoresInt: Int, imageName: String) {
        playerid.text = "\(id)"
        name.text = nameStr
        scores.text = "\(scoresInt)"
        playerPhoto.image = UIImage(named: imageName)
    }
}
