//
//  Dateformatter.swift
//  PinBoard
//
//  Created by Tina Thomsen on 23/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation

class Dateformatter {
	
	static func dkDateFormat(Date: Date)->String{
		let format = DateFormatter()
		format.dateFormat = "dd/MM/yyyy"
		let formattedDate = format.string(from: Date)
		return formattedDate
	}
}
