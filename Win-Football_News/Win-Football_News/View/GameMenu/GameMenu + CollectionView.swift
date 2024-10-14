
import Foundation
import UIKit

extension GameMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, FavouritesViewControllerDelegate {
    func reloadCollection() {
        selectPlayerView.favouritesCollectionView.reloadData()
    }
    
    func setupCollectionView() {
        selectPlayerView.favouritesCollectionView.dataSource = self
        selectPlayerView.favouritesCollectionView.delegate = self
        
        selectPlayerView.favouritesCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.reuseId)
    
   }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.favouritesCount == 0 {
            selectPlayerView.pleaseAdd.isHidden = false
        } else {
            selectPlayerView.pleaseAdd.isHidden = true
        }
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
        guard let player = viewModel.getPlayerIds(at: indexPath.row) else {
            return
        }
        GameModel.shared.currentPlayer = player.imageName + "Game"
        GameModel.shared.player = player
        selectPlayerView.removeFromSuperview()
        setupUI()
    }
}
