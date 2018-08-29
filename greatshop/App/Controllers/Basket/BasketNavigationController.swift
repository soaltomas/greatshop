import UIKit

class BasketNavigationController: UINavigationController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.topViewController as? BasketViewController)?.user = user
    }
}
