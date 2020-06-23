//
//  Pin.swift
//  PinBoard
//
//  Created by Tina Thomsen on 22/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import UIKit

class MarketPin {
	var id: String
	var headline: String
	var description: String
	var date: String
	var price: String
	var status: Bool
	var Uid: String
	
	init(id: String, headline: String, description:  String, date: String, price: String, status: Bool, Uid: String) {
		self.id = id
		self.headline = headline
		self.description = description
		self.date = date
		self.price = price
		self.status = status
		self.Uid = Uid
	}
}
