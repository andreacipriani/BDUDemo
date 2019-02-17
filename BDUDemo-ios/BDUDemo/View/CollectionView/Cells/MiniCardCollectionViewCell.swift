import UIKit

final class MiniCardCollectionViewCell: UICollectionViewCell, NewsCellConfigurable  {
    static let identifier = "MiniCardCollectionViewCell"
    static let desiredHeight: CGFloat = 87.0
    
    var adActionDelegate: AdViewActionLinkDelegate?
    
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    // MARK: - NewsCellStylable
    
    func style(with viewModel: NewsCellConfiguration) {
        titleLabel.text = viewModel.title
        categoryLabel.text = viewModel.category
    }
}
