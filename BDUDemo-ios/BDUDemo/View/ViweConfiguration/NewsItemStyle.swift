import Foundation
import UIKit

enum NewsItemStyle: String, Decodable {
    case topImageCard = "top_image_card"
    case bottomImageCard = "bottom_image_card"
    case mini = "mini"
    
    func cellIdentifier() -> String {
        switch self {
        case .topImageCard:
            return TopImageCardCollectionViewCell.identifier
        case .bottomImageCard:
            return BottomImageCardCollectionViewCell.identifier
        case .mini:
            return MiniCardCollectionViewCell.identifier
        }
    }
    
    var desiredHeight: CGFloat {
        switch self {
        case .topImageCard:
            return TopImageCardCollectionViewCell.desiredHeight
        case .bottomImageCard:
            return BottomImageCardCollectionViewCell.desiredHeight
        case .mini:
            return MiniCardCollectionViewCell.desiredHeight
        }
    }
}
