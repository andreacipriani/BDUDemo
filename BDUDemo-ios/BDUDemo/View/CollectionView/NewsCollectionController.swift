import Foundation
import UIKit

protocol NewsCollectionControlling {
    func udpate(with viewModels: [NewsViewModel])
}

final class NewsCollectionController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, NewsCollectionControlling {
    
    private let collectionView: UICollectionView
    private(set) var newsViewModels: [NewsViewModel] = []
    weak var sourceViewController: UIViewController?
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollectionView()
        registerCells()
    }
    
    // MARK: - CollectionView Controlling
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsViewModels.count //TODO: filter unsupported
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsViewModel = newsViewModels[indexPath.row]
        let identifier = newsViewModel.style.cellIdentifier()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! (UICollectionViewCell & NewsCellStylable) //TODO: handle unsupported
        cell.style(with: newsViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let sourceViewController = sourceViewController else { return }
        let newsViewModel = newsViewModels[indexPath.row]
    
        if let appLink = newsViewModel.link.app {
            let newsDeeplink = NewsDeeplink(urlString: appLink)
            NewsDeeplinkNavigator().navigate(to: newsDeeplink, from: sourceViewController)
        }
//        } else if let weblink = newsViewModel.link.web {
//            WeblinkHandler().navigate(to: weblink)
//        }

    }
    // MARK: - Private
    
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
