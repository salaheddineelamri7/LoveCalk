//
//  Helpers.swift
//  LoveCalk
//
//  Created by Mac on 6/1/19.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import Foundation



enum enumHoroscope {
	case Canser
}

class Helper {
	
	static func myHoroscope(_ date:  String) -> enumHoroscope {
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd-MM"
		let d = dateFormatter.date(from:date)!
			print(d)
		
		let dateFormatter2 = DateFormatter()
		dateFormatter2.dateFormat = "dd-MM"
		let d2 = dateFormatter2.date(from:"29/06")!
		
	
		
		 print(d.compare(d2).rawValue)
		
		return enumHoroscope.Canser
	}
	
}



