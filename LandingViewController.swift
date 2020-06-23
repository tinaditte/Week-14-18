
import UIKit
import  FirebaseAuth

class LandingViewController: UIViewController {
	@IBOutlet weak var emailTF: UITextField!
	@IBOutlet weak var passwordTF: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	@IBAction func loginBtn(_ sender: Any) {
		loginCheck(email: emailTF.text!, password: passwordTF.text!)
	}
	
	func loginCheck(email: String, password: String){
		if emailTF.text == "" || passwordTF.text == ""{
			print("Udfyldning af textfields mangler")
		}else{
			Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
				if error == nil{
					self.performSegue(withIdentifier: "loginSegue", sender: self)
				}else{
					print(error)
				}
			}
		}
	}
}
