

import UIKit

class DetailMarketViewController: UIViewController {
	@IBOutlet weak var addBtn: UIBarButtonItem!
	@IBOutlet weak var headlineTF: UITextField!
	@IBOutlet weak var priceTF: UITextField!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var bodyTV: UITextView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var statusLabel: UILabel!
	
	
	
	var today = Dateformatter.dkDateFormat(Date: Date())
	var rowNumber = 0
	let loggedInUID = UserHandler.getCurrentUID()
	var behaveAsNew = false

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		behaviour()
	}
	
	func behaviour(){
		if behaveAsNew == false{
			//Act as existing pin
			let pin = MarketPinHandler.getPinAt(Index: rowNumber)
			headlineTF.text! = pin.headline
			bodyTV.text! = pin.description
			dateLabel.text! = pin.date
			
			UserHandler.getUserInfo(uid: pin.Uid) { (User) in
				let userinfo = User
				self.nameLabel.text = userinfo.name
				self.addressLabel.text = userinfo.address
			}
		}
		else if behaveAsNew == true{
			headlineTF.isUserInteractionEnabled = true
			bodyTV.isEditable = true
			addBtn.isEnabled = true
			
			UserHandler.getUserInfo(uid: UserHandler.getCurrentUID()) { (User) in
				self.nameLabel.text = User.name
				self.addressLabel.text = User.address
				self.dateLabel.text = self.today
			}
			
		}
	}
	
	@IBAction func addBtn(_ sender: Any) {
		MarketPinHandler.CreatePin(headline: headlineTF.text!, descript: bodyTV.text!, date: today, price: priceTF.text!, status: false, userID: loggedInUID)
	}
	
}

