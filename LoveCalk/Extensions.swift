//
//  Extensions.swift
//  LoveCalk
//
//  Created by Mac on 6/1/19.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import Foundation



extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}
