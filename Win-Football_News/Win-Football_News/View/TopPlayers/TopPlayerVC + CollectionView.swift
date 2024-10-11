
import Foundation
import UIKit

extension TopPlayersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setupCollectionView() {
        leaguesCollectionView.dataSource = self
        leaguesCollectionView.delegate = self
        
        topPlayersCollectionView.dataSource = self
        topPlayersCollectionView.delegate = self
        
        leaguesCollectionView.register(LeagueCollectionViewCell.self, forCellWithReuseIdentifier: LeagueCollectionViewCell.reuseId)
        topPlayersCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.reuseId)
    
   }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstLoad {
            isFirstLoad = false
            
            let firstIndexPath = IndexPath(row: 0, section: 0)
            leaguesCollectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .centeredHorizontally)
            collectionView(leaguesCollectionView, didSelectItemAt: firstIndexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == leaguesCollectionView {
            return 4
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == leaguesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollectionViewCell.reuseId, for: indexPath) as? LeagueCollectionViewCell else {
                fatalError("Unable to dequeue LeagueCollectionViewCell")
//                return UICollectionViewCell()
            }
            cell.setupCell(id: indexPath.row)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.reuseId, for: indexPath) as? PlayerCollectionViewCell else {
                fatalError("Unable to dequeue PlayerCollectionViewCell")
//                return UICollectionViewCell()
            }
            guard let player = viewModel.getPlayerFrom(league: currentleague, playerId: indexPath.row + 1) else {
                return UICollectionViewCell()
            }
            cell.setupCell(player: player)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == leaguesCollectionView {
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? LeagueCollectionViewCell {
                selectedCell.selectImage()
                
                switch indexPath.row {
                case 0:
                    currentleague = .premierLeague
                case 1:
                    currentleague = .laLiga
                case 2:
                    currentleague = .serieA
                default:
                    currentleague = .bundesliga
                }
                
                topPlayersCollectionView.reloadData()
            }
            for i in 0..<collectionView.numberOfItems(inSection: indexPath.section) {
                if i != indexPath.row {
                    let deselectIndexPath = IndexPath(row: i, section: indexPath.section)
                    if let deselectedCell = collectionView.cellForItem(at: deselectIndexPath) as? LeagueCollectionViewCell {
                        deselectedCell.deselectImage()
                    }
                }
            }
        } else {
            let vc = PlayerStatsViewController()
            let player = viewModel.getPlayerFrom(league: currentleague, playerId: indexPath.row + 1)
            vc.player = player
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
