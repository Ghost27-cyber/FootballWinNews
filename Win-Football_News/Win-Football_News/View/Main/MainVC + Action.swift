
import Foundation
import UIKit

extension MainViewController {
    
    func setupButtons() {
        sortButton.addTarget(self, action: #selector(sortPressed), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(filterPressed), for: .touchUpInside)
        topButton.addTarget(self, action: #selector(topPressed), for: .touchUpInside)
        newsButton.addTarget(self, action: #selector(newsPressed), for: .touchUpInside)
        favouritesButton.addTarget(self, action: #selector(favouritesPressed), for: .touchUpInside)
        liveMatchesButton.addTarget(self, action: #selector(livePressed), for: .touchUpInside)
        
        sortView.cancelButton.addTarget(self, action: #selector(cancelSortPressed), for: .touchUpInside)
        sortView.earlierMatchesFirst.addTarget(self, action:#selector(sortByEarlier), for: .touchUpInside)
        sortView.laterMatchesFirst.addTarget(self, action:#selector(sortByLater), for: .touchUpInside)
        
        filterView.premierLeagueButton.addTarget(self, action: #selector(premierPressed), for: .touchUpInside)
        filterView.seriaAButton.addTarget(self, action: #selector(seriaAPressed), for: .touchUpInside)
        filterView.bundesligaButton.addTarget(self, action: #selector(bundesPressed), for: .touchUpInside)
        filterView.laLigaButton.addTarget(self, action: #selector(laLigaPressed), for: .touchUpInside)
        filterView.uclButton.addTarget(self, action: #selector(uclPressed), for: .touchUpInside)
        filterView.applyFilter.addTarget(self, action: #selector(applyPressed), for: .touchUpInside)
        filterView.cancelButton.addTarget(self, action: #selector(cancelFilterPressed), for: .touchUpInside)
    }
    
    @objc
    func livePressed() {
        let vc = LiveGamesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func favouritesPressed() {
        let vc = FavouritesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func topPressed() {
        let vc = TopPlayersViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func newsPressed() {
        let vc = NewsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func sortPressed() {
        if sortShowed == false {
            setupSort()
            sortShowed = true
        } else {
            sortShowed = false
            cancelSort()
        }
    }
    
    @objc
    func filterPressed() {
        if filterShowed == false {
            setupFilter()
            filterShowed = true
        } else {
            filterShowed = false
            cancelFilter()
        }
    }
    
    
}
