import Foundation
import UIKit

protocol NewsCollectionControlling {
    func udpate(with viewModels: [NewsViewModel])
}

final class NewsCollectionController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, NewsCollectionControlling {
    
    private let collectionView: UICollectionView
    private let navigator: Navigator
    private let fallbackReuseIdentifier = ""
    private(set) var newsViewModels: [NewsViewModel] = []
    weak var sourceViewController: UIViewController?
    
    init(collectionView: UICollectionView,
         navigator: Navigator = Navigator()) {
        self.collectionView = collectionView
        self.navigator = navigator
        super.init()
        setupCollectionView()
        registerCells()
    }
    
    // MARK: - CollectionView Controlling
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsViewModel = newsViewModels[indexPath.row]
        let identifier = newsViewModel.style.cellIdentifier()
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! (UICollectionViewCell & NewsCellConfigurable)
        cell.style(with: newsViewModel)
        cell.adActionDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let newsViewModel = newsViewModels[safe: indexPath.row] else { return }
        navigateTo(link: newsViewModel.link)
    }
    
    // MARK: - Private
    
    func navigateTo(link: NewsLink) {
        guard let sourceViewController = sourceViewController else { return }
        let navigationLink = NavigationLink.make(from: link)
        navigator.navigate(to: navigationLink, fallbackUrlString: link.web, from: sourceViewController)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    }
    
    func registerCells() {
        registerCell(withIdentifier: BottomImageCardCollectionViewCell.identifier)
        registerCell(withIdentifier: TopImageCardCollectionViewCell.identifier)
    }
    
    func registerCell(withIdentifier identifier: String) {
        collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    // MARK: - NewsCollectionControlling
    
    func udpate(with viewModels: [NewsViewModel]) {
        self.newsViewModels = viewModels
        collectionView.reloadData()
    }
}

extension NewsCollectionController: AdViewActionLinkDelegate {
    func didPressAdButton(link: NewsLink) {
        navigateTo(link: link)
    }
}
