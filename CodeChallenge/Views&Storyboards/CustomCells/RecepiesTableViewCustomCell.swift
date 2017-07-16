import Foundation
import UIKit
import SDWebImage
import Cosmos

class RecepiesTableViewCustomCell: UITableViewCell {
    
    @IBOutlet var reciepeImageView : UIImageView!
    @IBOutlet var reciepeName : UILabel!
    @IBOutlet var descriptionLabel : UILabel!
    @IBOutlet var favourtieButton : UIButton!
    @IBOutlet var clearButton : UIButton!
    @IBOutlet var starView : CosmosView!
    
    
    override func awakeFromNib() {
        
    }
    
    open func populateReceiepeObject(_ recepieObj : Reciepe)  {
        
        reciepeImageView.sd_setImage(with: URL(string: recepieObj.image), placeholderImage: UIImage(named: PlaceHolderImage))
        reciepeName.text = recepieObj.name
        descriptionLabel.text = recepieObj.desc
        favourtieButton.isSelected=false
        if let favourite = recepieObj.favorite.value {
            favourtieButton.isSelected=favourite
        }
        
        if let rating = recepieObj.rating.value {
            starView.rating = Double(rating)
            clearButton.isHidden=false
        }
        else
        {
            starView.rating = 0.0
            clearButton.isHidden=true
        }

    }
    
}
