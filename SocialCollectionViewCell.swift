//
//  SocialCollectionViewCell.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class SocialCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var bodyTV: UITextView!
	@IBOutlet weak var dateLabel: UILabel!
	
	func setup(pin: SocialPin){
		headlineLabel.text = pin.headline
		headlineLabel.numberOfLines = 2
		headlineLabel.lineBreakMode = .byWordWrapping
		bodyTV.text = pin.description
		dateLabel.text = pin.date
	}
	
}
