import UIKit

final class BottomCardCollectionViewCell: UICollectionViewCell, NewsCellStylable {
    
    static let identifier = "BottomCardCollectionViewCell"
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleCell()
    }
    
    // MARK: - NewsCellStylable
    
    func style(with viewModel: NewsViewModel) {
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
