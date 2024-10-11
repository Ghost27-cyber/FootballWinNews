
import Foundation
import UIKit

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupCollectionView() {
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsCollectionView.showsVerticalScrollIndicator = false
        
        newsCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getCountItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.reuseId, for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let news = viewModel.getNews(by: indexPath.row) else {
            return cell
        }
        
        cell.setupCell(news)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let news = viewModel.getNews(by: indexPath.row) else {
            return 
        }
        
        let vc = NewsDetailsViewController()
        vc.news = news
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
