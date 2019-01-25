import UIKit

protocol NewsPresenterOutput: class {
    func showLoading()
    func showError()
    func show(news: [NewsViewModel])
}

final class NewsViewController: UIViewController, NewsPresenterOutput {

    private(set) var collectionController: NewsCollectionController!
    private(set) var presenter: NewsPresenting!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Public
    
    convenience init(presenter: NewsPresenting) {
        self.init()
        self.presenter = presenter
        self.presenter.view = self
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupCollectionController()
        presenter.loadNews()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = collectionController
        collectionView.dataSource = collectionController
    }
    
    func setupCollectionController() {
        collectionController = NewsCollectionController(collectionView: collectionView)
    }
    
    // MARK: - NewsPresenterOutput
    
    func showLoading() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func showError() {
        activityIndicator.stopAnimating()
        showOKAlert(with: "Network error, please retry")
    }

    func show(news: [NewsViewModel]) {
        activityIndicator.stopAnimating()
        collectionController.udpate(with: news)
    }
    
    // MARK: - Private
    
    func showOKAlert(with message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }

}
