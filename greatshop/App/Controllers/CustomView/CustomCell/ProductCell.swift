import UIKit

class ProductCell: UITableViewCell {
    
    let cellColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.1)

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 20
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize.zero
        contentView.backgroundColor = cellColor
    }
}
