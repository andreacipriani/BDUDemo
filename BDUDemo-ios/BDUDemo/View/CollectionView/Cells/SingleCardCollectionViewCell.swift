import UIKit

final class SingleCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SingleCardCollectionViewCell"
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleCell()
    }
    
    func update(with viewModel: NewsViewModel) {
        titleLabel.text = viewModel.title
        categoryLabel.text = viewModel.category
        imageView.image = viewModel.image
    }
    
    // MARK: - Private
    
    private func styleCell() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 8;
    }
}
