import UIKit
import Crashlytics

class LoginViewController: UIViewController, Animations, TrackableMixin {
    
    enum Constants {
        enum SegueName {
            static let successLogin = "SuccessLoginSegue"
        }
    }
    
    @IBOutlet var customView: LoginView!
    var authorizedUser: User!
    
    var authRequestFactory = AuthRequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func auth(_ sender: UIButton) {
        
        buttonAnimation(button: sender)
        
        guard
            let userName = customView.usernameLabel.text,
            !userName.isEmpty,
            let password = customView.passwordLabel.text,
            !password.isEmpty else {
                UIView.animate(withDuration: 0.5) { () -> Void in
                    self.customView.errorLabel.isHidden = false
                }
                return
        }
        
        authRequestFactory.login(login: userName, password: password, completionHandler: { [weak self] response in
            let loginResponse = response.value
            if loginResponse?.result == 1 {
                self?.authorizedUser = loginResponse?.user
                self?.performSegue(withIdentifier: Constants.SegueName.successLogin, sender: nil)
                
                self?.track(.login(
                    method: AnalyticEvent.LoginParams.defaultMethod,
                    success: true))
                
            } else {
                self?.track(.login(
                    method: AnalyticEvent.LoginParams.defaultMethod,
                    success: false))
                
                self?.customView.setError()
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueName.successLogin {
            guard
                let tabBarController = segue.destination as? UITabBarController,
                let homeViewController: HomeViewController = tabBarController.getController(),
                let settingsViewController: SettingsNavigationController = tabBarController.getController(),
                let basketViewController: BasketNavigationController = tabBarController.getController() else {
                    assertionFailure("Segue error!")
                    return
            }
            homeViewController.user = authorizedUser
            settingsViewController.user = authorizedUser
            basketViewController.user = authorizedUser
        }
    }
}

extension UITabBarController {
    func getController<Controller>() -> Controller? {
        return viewControllers?.first(where: { $0 is Controller}) as? Controller
    }
}

func assertionFailure(_ message: String) {
    #if DEBUG
        Swift.assertionFailure(message)
    #else
        Answers.logCustomEvent(withName: "assertionFailure", customAttributes: ["message" : message])
    #endif
}
