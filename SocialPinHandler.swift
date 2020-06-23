import Foundation
import FirebaseFirestore

class SocialPinHandler{
	static var listOfSocial = [SocialPin]()
	static let db = Firestore.firestore()

	static func CreatePin(headline: String, descript: String, date: String, userID: String)-> SocialPin{
		var map = [String: String]()
		map["Headline"] = headline
		map["Description"] = descript
		map["Date"] = date
		map["User"] = userID
	
		let docadd = db.collection("SocialPin").addDocument(data: map)
		let newPin = SocialPin(id: docadd.documentID, headline: headline, description: descript, date: date, Uid: userID )
		listOfSocial.append(newPin)
		
		return newPin
	}
	
	static func ListenForPins(collectionView: UICollectionView){
		print("Listening for Social pins")
		db.collection("SocialPin").addSnapshotListener { (snap, error) in
			if error == nil{
				self.listOfSocial.removeAll() //Avoid dups
				for pin in snap!.documents{
					let map = pin.data()
					let headline = map["Headline"] as! String
					let description = map["Description"] as! String
					let date = map["Date"] as! String
					let userid = map["User"] as! String
					
					let readPin = SocialPin(id: pin.documentID, headline: headline, description: description, date: date, Uid: userid)
					listOfSocial.append(readPin)
				}
			}
			DispatchQueue.main.async{
			collectionView.reloadData()
			}
		}
	}
	
	static func getSize() -> Int{
		return listOfSocial.count
	}
	
	static func getPinAt(Index: Int) -> SocialPin{
		return listOfSocial[Index]
	}
}

