//
//  SocialViewController.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	@IBOutlet weak var socialBoard: UICollectionView!
	private var newPinMode = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		socialBoard.delegate = self
		socialBoard.dataSource = self
		SocialPinHandler.ListenForPins(collectionView: socialBoard)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		socialBoard.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "addSocial"{
			newPinMode = true
			if let destination = segue.destination as? DetailSocialViewController{
				destination.behaveAsNew = newPinMode
			}
		}
		if segue.identifier == "toSocial"{
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return SocialPinHandler.getSize()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let pin = SocialPinHandler.getPinAt(Index: indexPath.row)
		let cell = socialBoard.dequeueReusableCell(withReuseIdentifier: "socialCell", for: indexPath) as! SocialCollectionViewCell
		cell.setup(pin: pin)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
			  // handle selected pin
			  print("You selected cell \(indexPath.item)!")
			  
			  let vc = storyboard?.instantiateViewController(identifier: "DetailSocialViewController") as? DetailSocialViewController
			  vc?.rowNumber = indexPath.row
			  self.navigationController?.pushViewController(vc!, animated: true)
	}
}
