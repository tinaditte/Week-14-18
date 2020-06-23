//
//  UserHandler.swift
//  PinBoard
//
//  Created by Tina Thomsen on 23/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import  FirebaseAuth
import UIKit
import  FirebaseFirestore

class UserHandler{
	static var list = [User]()
	static let db = Firestore.firestore()
	static var value  = 0 //
	
	static func CreateUser(email: String, name: String, address: String, password: String){
		let docref = db.collection("User")
		
		Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
			if error == nil{
				let userID = Auth.auth().currentUser!.uid
				docref.document(userID).setData(["E-mail" : email, "Name": name, "Address": address])
				let newUser = User(uid: userID, email: email, name: name, address: address)
				list.append(newUser)
			}
		}
	}
	
	static func getUserInfo(uid: String, completion: @escaping (User)->()){
		let docref = db.collection("User").document(uid)
		docref.getDocument { (doc, error) in
			if let doc = doc{
				let map = doc.data()
				let name = map?["Name"] as! String
				let address = map?["Address"] as! String
				let email = map?["E-mail"] as! String
				
				let currentUser = User(uid: doc.documentID, email: email, name: name, address: address)
				completion(currentUser)
			}
		}
	}
	
	static func getCurrentUID()-> String{
		let loggedinUser = FirebaseAuth.Auth.auth().currentUser!.uid
		return loggedinUser
	}	
}
