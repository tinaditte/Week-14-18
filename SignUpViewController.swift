//
//  SignUpViewController.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
	@IBOutlet weak var emailTF: UITextField!
	@IBOutlet weak var passwordTF: UITextField!
	@IBOutlet weak var passwordTF2: UITextField!
	@IBOutlet weak var nameTF: UITextField!
	@IBOutlet weak var addressTF: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	@IBAction func signUpBtn(_ sender: Any) {
		let email = emailTF.text!
		let password = passwordTF.text!
		let name = nameTF.text!
		let address = addressTF.text!
		
		if passwordTF.text == passwordTF2.text{
			UserHandler.CreateUser(email: email, name: name, address: address, password: password)
			self.performSegue(withIdentifier: "signupSegue", sender: self)
		}else{
			print("passwords doesnt match")
		}
	}
}
