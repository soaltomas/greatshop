import UIKit

class SettingsView: UITableView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let genderPickerValues = ["Male", "Female", "None"]
    var genderPickerIsHidden = true

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var creditCardField: UITextField!
    @IBOutlet weak var genderField: UILabel!
    @IBOutlet weak var genderPicker: UIPickerView! {
        didSet {
            genderPicker.delegate = self
            genderPicker.dataSource = self
        }
    }
    @IBOutlet weak var biographyField: UITextView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderPickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderPickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        genderField.text = genderPickerValues[row]
    }
    
}
