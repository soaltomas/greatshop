import UIKit

protocol Animations {
    func productCellAnimation(cell: UITableViewCell)
    func buttonAnimation(button: UIButton)
}

extension Animations {
    func productCellAnimation(cell: UITableViewCell) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
            })
        })
    }
    
    func buttonAnimation(button: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            button.transform = CGAffineTransform.identity
                        }
        })
    }
}
