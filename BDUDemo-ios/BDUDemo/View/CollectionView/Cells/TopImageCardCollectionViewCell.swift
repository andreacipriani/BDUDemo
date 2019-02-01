import UIKit

final class TopImageCardCollectionViewCell: UICollectionViewCell, NewsCellStylable {

    static let identifier = "TopImageCardCollectionViewCell"

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var adContainerView: UIView!
    private var adView: AdView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    // MARK: - NewsCellStylable
    
    func style(with viewModel: NewsViewModel) {
        categoryLabel.text = viewModel.category
        authorLabel.text = viewModel.author
        titleLabel.text = viewModel.title
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
    }
}
