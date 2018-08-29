import UIKit

class HomeViewController: UIViewController {

   
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(user.firstName) \(user.lastName)"
    }
    
}
