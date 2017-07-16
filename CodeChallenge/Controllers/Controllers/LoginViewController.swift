/*
 
 NASIR MAHMOOD
 
 Comment:
 Controller 
 Made with Realm and  MApper to automap s to RealmDatabase.
 
 Extension: LoginViewController+ValidatorExtension
 
 */
import Validator

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: TextField!
    @IBOutlet var passwordTextField: TextField!
    @IBOutlet var loginButton : UIButton!
    
    @IBOutlet private(set) var emailStateLabel: UILabel!
    @IBOutlet private(set) var passwordStateLabel: UILabel!

    var emailvalidationRuleSet: ValidationRuleSet<String>?
    var passwordvalidationRuleSet: ValidationRuleSet<String>?

    
    //MARK: UIView Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setValidators()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // pass arguements to details VC
    }
    
    //MARK: Outlets
    @IBAction func loginButtonPressed(_ sender : Any){
        if updateValidationStatusForButton() {
            performSegue(withIdentifier: SegueNames.loginToRecipiesSegue, sender: self)
        }
    }

}


