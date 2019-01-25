import Foundation
import UIKit

protocol NewsCollectionControlling {
    func udpate(with viewModels: [NewsViewModel])
}

final class NewsCollectionController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, NewsCollectionControlling {
    
    private let collectionView: UICollectionView
    private(set) var newsViewModels: [NewsViewModel] = []

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollectionView()
    }
    
    // MARK: - CollectionView Controlling
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsViewModels.count //TODO: filter unsupported
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsViewModel = newsViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleCardCollectionViewCell.identifier, for: indexPath) as! SingleCardCollectionViewCell
        cell.update(with: newsViewModel)
        return cell
    }
    
    // MARK: - Private
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: SingleCardCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SingleCardCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    }
    
    // MARK: - NewsCollectionControlling
    
    func udpate(with viewModels: [NewsViewModel]) {
        self.newsViewModels = viewModels
        collectionView.reloadData()
    }
}
