//
//  MarketCollectionViewCell.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class MarketCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var bodyTV: UITextView!
	@IBOutlet weak var priceLabel: UILabel!
	
		
		func setup(pin: MarketPin){
			headlineLabel.text! = pin.headline
			headlineLabel.numberOfLines = 2
			headlineLabel.lineBreakMode = .byWordWrapping
			bodyTV.text! = pin.description
			priceLabel.text! = pin.price
			
			if pin.status == true{
				headlineLabel.textColor = UIColor.green
			}
			if pin.status == false{
				headlineLabel.textColor = UIColor.red
				priceLabel.text = "SOLD"
			}
		}
}
