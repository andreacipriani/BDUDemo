import UIKit

final class SingleCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SingleCardCollectionViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with viewModel: NewsViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }
}
