//
//  DetailSocialViewController.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class DetailSocialViewController: UIViewController {
	@IBOutlet weak var headlineTF: UITextField!
	@IBOutlet weak var bodyTV: UITextView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var btnSave: UIBarButtonItem!
	
	
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
			let pin = SocialPinHandler.getPinAt(Index: rowNumber)
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
			btnSave.isEnabled = true
			
			UserHandler.getUserInfo(uid: UserHandler.getCurrentUID()) { (User) in
				self.nameLabel.text = User.name
				self.addressLabel.text = User.address
				self.dateLabel.text = self.today
			}
			
		}
	}

	@IBAction func savebtn(_ sender: Any) {
		SocialPinHandler.CreatePin(headline: headlineTF.text!, descript: bodyTV.text!, date: today, userID: loggedInUID)
	}
}
