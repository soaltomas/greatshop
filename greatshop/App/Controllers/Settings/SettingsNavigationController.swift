import UIKit

class SettingsNavigationController: UINavigationController {

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.topViewController as? SettingsViewController)?.user = user
    }
}
