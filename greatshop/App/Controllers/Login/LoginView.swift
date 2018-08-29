import UIKit

class LoginView: UIView {
    
    var shadowSwitch = true
    
    @IBOutlet weak var usernameLabel: UITextField! {
        didSet {
            usernameLabel.layer.shadowRadius = 4.0
            usernameLabel.layer.shadowOpacity = 0.6
            usernameLabel.layer.shadowOffset = CGSize.zero
        }
    }
    @IBOutlet weak var passwordLabel: UITextField! {
        didSet {
            passwordLabel.layer.shadowRadius = 4.0
            passwordLabel.layer.shadowOpacity = 0.6
            passwordLabel.layer.shadowOffset = CGSize.zero
        }
    }
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!

    func setError() {
        errorLabel.isHidden = false
    }
}
