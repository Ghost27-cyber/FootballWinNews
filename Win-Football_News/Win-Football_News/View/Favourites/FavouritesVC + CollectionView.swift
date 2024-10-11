
import Foundation
import UIKit

protocol FavouritesViewControllerDelegate: AnyObject {
    func reloadCollection()
}

extension FavouritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, FavouritesViewControllerDelegate {
    func reloadCollection() {
        favouritesCollectionView.reloadData()
    }
    
    func setupCollectionView() {
        favouritesCollectionView.dataSource = self
        favouritesCollectionView.delegate = self
        
        favouritesCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.reuseId)
    
   }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favouritesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.reuseId, for: indexPath) as? PlayerCollectionViewCell else {
            fatalError("Unable to dequeue PlayerCollectionViewCell")
//                return UICollectionViewCell()
        }
        guard let player = viewModel.getPlayerIds(at: indexPath.row) else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(player: player, isFavouritePlayer: true)
        cell.isFavouritesVC = true
        cell.delegate = self
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PlayerStatsViewController()
        guard let player = viewModel.getPlayerIds(at: indexPath.row) else {
            return 
        }
        vc.player = player
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
