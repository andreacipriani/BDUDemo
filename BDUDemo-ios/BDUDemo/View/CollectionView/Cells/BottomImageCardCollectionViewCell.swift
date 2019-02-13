import UIKit

final class BottomImageCardCollectionViewCell: UICollectionViewCell, NewsCellConfigurable {
    
    static let identifier = "BottomImageCardCollectionViewCell"
    static let desiredHeight: CGFloat = 380.0
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var adContainerView: UIView!
    private var adView: AdView!
    private var newsViewModel: NewsViewModel?
    weak var adActionDelegate: AdViewActionLinkDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    // MARK: - NewsCellStylable
    
    func style(with viewModel: NewsViewModel) {
        newsViewModel = viewModel

        titleLabel.text = viewModel.title
        categoryLabel.text = viewModel.category
        imageView.image = viewModel.image
        adContainerView.isHidden = viewModel.ad == nil
        adView.style(with: viewModel.ad)
    }
    
    // MARK: - Private
    
    private func configureCell() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 8;
        insertAdView()
    }
    
    private func insertAdView() {
        adView = AdView.makeFromNib()
        adContainerView.addSubview(adView)
        adView.constrainToSuperView()
        adView.actionDelegate = self
    }
}

extension BottomImageCardCollectionViewCell: AdViewActionDelegate {
    func didPressAdButton() {
        guard let newsViewModel = newsViewModel, let link = newsViewModel.ad?.link else { return }
        adActionDelegate?.didPressAdButton(link: link)
    }
}
