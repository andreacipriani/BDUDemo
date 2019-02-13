import UIKit

final class AdView: UIView {
    @IBOutlet weak var openAdButton: UIButton!
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adImageView: UIImageView!
    
    static func makeFromNib() -> AdView {
        let adViewNib = UINib(nibName: "AdView", bundle: nil)
        let adViews = adViewNib.instantiate(withOwner: self, options: nil)
        return adViews.first as! AdView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public
    
    public func style(with viewModel: NewsAdViewModel?) {
        isHidden = viewModel == nil
        guard let viewModel = viewModel else { return }
        adTitleLabel.text = viewModel.title
        openAdButton.setTitle(viewModel.callToAction, for: .normal)
        adImageView.image = viewModel.image
    }
}
