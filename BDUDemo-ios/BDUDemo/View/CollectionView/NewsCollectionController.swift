import Foundation
import UIKit

protocol NewsCollectionControlling {
    func udpate(with viewModels: [NewsViewModel])
}

final class NewsCollectionController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NewsCollectionControlling {
    
    private let collectionView: UICollectionView
    private(set) var newsViewModels: [NewsViewModel] = []

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionView.register(UINib(nibName: CardCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsViewModels.count //TODO: filter unsupported
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsViewModel = newsViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        cell.update(with: newsViewModel)
        return cell
    }
    
    // MARK: - NewsCollectionControlling
    
    func udpate(with viewModels: [NewsViewModel]) {
        self.newsViewModels = viewModels
        collectionView.reloadData()
    }
}
