
import UIKit
import SnapKit

protocol MainViewModelDelegate: AnyObject {
    func matchesLoaded()
}

class MainViewController: UIViewController, MainViewModelDelegate {
    
    var viewModel: MainViewModel!
    var mainView = MainView()
    var sortView = SortView()
    var filterView = FilterView()
    var currentSort = 0
    var filterShowed = false
    var sortShowed = false
    var currentTournament = ""
    var showMoreButtonVisible = false
    
    // Объявляем индикатор активности
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    public let footerView: UIView = {
           let view = UIView()
           let button = UIButton()
           button.setTitle("Load More", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = Resources.Colors.darkBlueColor
           button.layer.cornerRadius = 10
           button.addTarget(self, action: #selector(loadMoreCells), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(button)
           view.isHidden = true // Скрываем кнопку по умолчанию
           button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
           button.heightAnchor.constraint(equalToConstant: 47).isActive = true
           button.widthAnchor.constraint(equalToConstant: 209).isActive = true
           return view
       }()
    
    public let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.filtersButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let sortButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Images.Buttons.sortButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let favouritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "favouritesButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let liveMatchesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "liveMatchesButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoImage: UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: "ballLogoImage")
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let topButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "topButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let newsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "newsButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let loaderView = LoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupActivityIndicator()
        setupColletionView()
        setupButtons()
        startLoadingAnimation()
    }
    
    func setupViewModel() {
        viewModel = MainViewModel()
        viewModel.delegate = self
    }

    func setupActivityIndicator() {
//        view.addSubview(activityIndicator)
//        
//        NSLayoutConstraint.activate([
//            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        view.addSubview(loaderView)
        loaderView.isHidden = true
        loaderView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func startLoadingAnimation() {
//        activityIndicator.isHidden = false
//        self.view.bringSubviewToFront(activityIndicator)
//        activityIndicator.startAnimating()
        loaderView.isHidden = false
        self.view.bringSubviewToFront(loaderView)
        loaderView.setupLoading()
        
    }
    
    func stopLoadingAnimation() {
        loaderView.isHidden = true
    }
    
    func showError(str: String) {
        let errorVC = ErrorViewController()
        errorVC.configure(with: str)
        self.navigationController?.pushViewController(errorVC, animated: true)
    }
    
    //MARK: - MainViewModelDelegate
    func matchesLoaded() {
        stopLoadingAnimation()
        //mainView not added
        if !mainView.isDescendant(of: view) {
            view.addSubview(mainView)
            mainView.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = Resources.Colors.mainBackgroundColor
            NSLayoutConstraint.activate([
                mainView.topAnchor.constraint(equalTo: self.view.topAnchor),
                mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
            
            
            view.addSubview(sortButton)
            sortButton.snp.makeConstraints { make in
                make.size.equalTo(28)
                make.top.equalToSuperview().offset(70)
                make.trailing.equalToSuperview().offset(-17)
            }
            view.addSubview(filterButton)
            filterButton.snp.makeConstraints { make in
                make.size.equalTo(28)
                make.top.equalToSuperview().offset(70)
                make.trailing.equalTo(sortButton.snp.leading).offset(-17)
            }
            view.addSubview(favouritesButton)
            favouritesButton.snp.makeConstraints { make in
                make.size.equalTo(28)
                make.top.equalToSuperview().offset(70)
                make.trailing.equalTo(filterButton.snp.leading).offset(-17)
            }
            view.addSubview(liveMatchesButton)
            liveMatchesButton.snp.makeConstraints { make in
                make.size.equalTo(28)
                make.top.equalToSuperview().offset(70)
                make.trailing.equalTo(favouritesButton.snp.leading).offset(-17)
            }
            view.addSubview(logoImage)
            logoImage.snp.makeConstraints { make in
                make.size.equalTo(37)
                make.leading.equalToSuperview().offset(16)
                make.top.equalToSuperview().offset(65)
            }
            
            view.addSubview(topButton)
            topButton.snp.makeConstraints { make in
                make.top.equalTo(liveMatchesButton.snp.bottom).offset(23)
                make.width.equalTo(158)
                make.height.equalTo(50)
                make.leading.equalToSuperview().offset(16)
            }
            
            view.addSubview(newsButton)
            newsButton.snp.makeConstraints { make in
                make.top.equalTo(liveMatchesButton.snp.bottom).offset(23)
                make.width.equalTo(158)
                make.height.equalTo(50)
                make.trailing.equalToSuperview().offset(-16)
            }
            
            view.addSubview(collectionView)
            collectionView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(17)
                make.trailing.equalToSuperview().offset(-17)
                make.bottom.equalToSuperview()
                make.top.equalTo(topButton.snp.bottom).offset(23)
            }
            
        } else {
            collectionView.scrollsToTop = true
            collectionView.reloadData()
            collectionView.isHidden = false
        }
        
    }
    
    func showError(message: String) {
        stopLoadingAnimation()
        ErrorHandler.shared.showErrorAlert(message: message, viewController: self)
    }
}
