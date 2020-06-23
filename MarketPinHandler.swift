//
//  PinHandler.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import FirebaseFirestore

class MarketPinHandler{
	static var listOfMarket = [MarketPin]()
	static let db = Firestore.firestore()
	
	static func CreatePin(headline: String, descript: String, date: String, price: String, status: Bool, userID: String)-> MarketPin{
		var map = [String: Any]()
		map["Headline"] = headline
		map["Description"] = descript
		map["Date"] = date
		map["Price"] = price
		map["Status"] = status
		map["User"] = userID
		
		let docadd = db.collection("MarketPin").addDocument(data: map)
		let newPin = MarketPin(id: docadd.documentID, headline: headline, description: descript, date: date, price: price, status: status, Uid: userID)
		listOfMarket.append(newPin)
		
		return newPin
	}
	
	static func ListenforPins(collectionView: UICollectionView){
		print("Listening for Market Pin")
		db.collection("MarketPin").addSnapshotListener { (snap, error) in
			if error == nil{
				self.listOfMarket.removeAll()
				for pin in snap!.documents{
					let map = pin.data()
					let headline = map["Headline"] as! String
					let description = map["Description"] as! String
					let date = map["Date"] as! String
					let price = map["Price"] as! String
					let status = map["Status"] as! Bool
					let userid = map["User"] as! String
					
					let readPin = MarketPin(id: pin.documentID, headline: headline, description: description, date: date, price: price, status: status, Uid: userid)
					print(readPin)
					listOfMarket.append(readPin)
				}
			}
			DispatchQueue.main.async{
				collectionView.reloadData()
			}
		}
	}
	
	static func getSize() -> Int{
		return listOfMarket.count
	}
	
	static func getPinAt(Index: Int) -> MarketPin{
			return listOfMarket[Index]
	}
}

