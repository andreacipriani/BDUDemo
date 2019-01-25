import UIKit

final class TopCardCollectionViewCell: UICollectionViewCell, NewsCellStylable {

    static let identifier = "TopCardCollectionViewCell"

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleCell()
    }
    
    // MARK: - NewsCellStylable
    
    func style(with viewModel: NewsViewModel) {
        categoryLabel.text = viewModel.category
        authorLabel.text = viewModel.author
        titleLabel.text = viewModel.title
        imageView.image = viewModel.image
    }
    
    // MARK: - Private
    
    private func styleCell() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 8;
    }
}
