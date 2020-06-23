//
//  MarketViewController.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	@IBOutlet weak var marketBoard: UICollectionView!
	private var newPinMode = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		marketBoard.delegate = self
		marketBoard.dataSource = self
		MarketPinHandler.ListenforPins(collectionView: marketBoard)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		marketBoard.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "addMarket"{
			newPinMode = true
			if let destination = segue.destination as? DetailMarketViewController{
				destination.behaveAsNew = newPinMode
			}
		}
		if segue.identifier == "toMarket"{
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print(MarketPinHandler.getSize())
		return MarketPinHandler.getSize()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let pin = MarketPinHandler.getPinAt(Index: indexPath.row)
		let cell = marketBoard.dequeueReusableCell(withReuseIdentifier: "marketCell", for: indexPath) as! MarketCollectionViewCell
		cell.setup(pin: pin)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		  // handle selected pin
		  print("You selected cell \(indexPath.item)!")
		  
		  let vc = storyboard?.instantiateViewController(identifier: "DetailMarketViewController") as? DetailMarketViewController
		  vc?.rowNumber = indexPath.row
		  self.navigationController?.pushViewController(vc!, animated: true)
	  }
}
