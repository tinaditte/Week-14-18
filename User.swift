//
//  User.swift
//  PinBoard
//
//  Created by Tina Thomsen on 23/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation

class User{
	var uid: String
	var email: String
	var name: String
	var address: String
	
	init(uid: String, email: String, name: String, address: String) {
		self.uid = uid
		self.email = email
		self.name = name
		self.address  = address
	}
}
