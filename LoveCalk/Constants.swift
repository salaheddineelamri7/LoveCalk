//
//  Constants.swift
//  LoveCalk
//
//  Created by Mac on 5/23/19.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import Foundation



struct Constants {
    
    static var base = "https://horoscope-api.herokuapp.com/horoscope/"
   
    static func getURL(value:String) -> String {
       return  "\(Constants.base)\(value)/Aries"
    }
    
    
}
