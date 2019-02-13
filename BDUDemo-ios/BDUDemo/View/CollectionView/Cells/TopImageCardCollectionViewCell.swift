import UIKit

final class TopImageCardCollectionViewCell: UICollectionViewCell, NewsCellStylable {

    static let identifier = "TopImageCardCollectionViewCell"

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var adContainerView: UIView!
    @IBOutlet weak var authorLabelHeightConstraint: NSLayoutConstraint!
    private let authorLabelDefaultHeight: CGFloat = 25.0
    
    private var adView: AdView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearState()
    }
    
    // MARK: - NewsCellStylable
    
    func style(with viewModel: NewsViewModel) {
        // Data
        categoryLabel.text = viewModel.category
        titleLabel.text = viewModel.title
        imageView.image = viewModel.image
        authorLabel.text = viewModel.author
        
        // Style
        adContainerView.isHidden = viewModel.ad == nil
        adView.style(with: viewModel.ad)
        
        let shouldShowAuthor = viewModel.author != nil
        authorLabel.isHidden = !shouldShowAuthor
        adjustLayoutForAuthorLabel(showing: shouldShowAuthor)
        
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }

    func clearState() {
        authorLabelHeightConstraint.constant = authorLabelDefaultHeight
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
    
    private func adjustLayoutForAuthorLabel(showing: Bool) {
        authorLabelHeightConstraint.constant = showing ? authorLabelDefaultHeight : 0
    }
}
