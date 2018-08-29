import UIKit

class SettingsViewController: UITableViewController, Animations {
    
    @IBOutlet var customView: SettingsView!
    var user: User!
    
    let authRequestFactory = AuthRequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeButton(_ sender: Any) {
        
        guard
            let userName = customView.usernameField.text,
            !userName.isEmpty,
            let password = customView.passwordField.text,
            !password.isEmpty,
            let email = customView.emailField.text,
            !email.isEmpty,
            let creditCard = customView.creditCardField.text,
            !creditCard.isEmpty,
            let gender = customView.genderField.text,
            let biography = customView.biographyField.text else {
                return
        }
        
        authRequestFactory.addOrUpdateUser(userId: user.id, login: userName, password: password, email: email, gender: gender, creditCard: creditCard, biography: biography, completionHandler: { response in
            let response = response.value
            if response?.result == 1 {
                self.viewMessage(title: "Successfully", message: "Your profile has been successfully saved.")
            } else {
                self.viewMessage(title: "Error", message: "Oops! There was some mistake.")
            }
        })
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 4 && indexPath.row == 0 {
            customView.genderPickerIsHidden = !customView.genderPickerIsHidden
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if customView.genderPickerIsHidden && indexPath.section == 4 && indexPath.row == 1 {
            return 0
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    func viewMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
        {
            (UIAlertAction) -> Void in
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
        {
            () -> Void in
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        productCellAnimation(cell: cell)
    }
}
