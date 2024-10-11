
import Foundation
import UIKit

extension LiveGamesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func reloadCollection() {
        liveGamesCollectionView.reloadData()
    }
    
    func setupCollectionView() {
        liveGamesCollectionView.dataSource = self
        liveGamesCollectionView.delegate = self
        
        liveGamesCollectionView.register(LiveGameCollectionViewCell.self, forCellWithReuseIdentifier: LiveGameCollectionViewCell.reuseId)
    
   }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCountGames()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveGameCollectionViewCell.reuseId, for: indexPath) as? LiveGameCollectionViewCell else {
                return UICollectionViewCell()
        }
        let liveGame = viewModel.getLiveGame(by: indexPath.row)
        cell.setupCell(match: liveGame)
        return cell
        
    }
}
