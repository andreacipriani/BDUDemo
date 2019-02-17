import UIKit

protocol AdViewActionDelegate: class {
    func didPressAdButton()
}

final class AdView: UIView {
    @IBOutlet weak var openAdButton: UIButton!
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adImageView: UIImageView!
    weak var actionDelegate: AdViewActionDelegate?
    
    static func makeFromNib() -> AdView {
        let adViewNib = UINib(nibName: "AdView", bundle: nil)
        let adViews = adViewNib.instantiate(withOwner: self, options: nil)
        return adViews.first as! AdView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        openAdButton.addTarget(self, action: #selector(didPressAdButton), for: .touchUpInside)
    }
    
    // MARK: - Public
    
    public func style(with viewModel: NewsAdCellConfiguration?) {
        isHidden = viewModel == nil
        guard let viewModel = viewModel else { return }
        adTitleLabel.text = viewModel.title
        openAdButton.setTitle(viewModel.callToAction, for: .normal)
        adImageView.image = viewModel.image
    }
    
    @objc private func didPressAdButton() {
        actionDelegate?.didPressAdButton()
    }
}
