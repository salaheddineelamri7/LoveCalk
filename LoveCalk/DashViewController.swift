//
//  DashViewController.swift
//  LoveCalk
//
//  Created by Mahdi Boukhris on 26/06/2019.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit

class DashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
	

	
	@IBAction func handleButton(_ sender: UIButton) {
		
		switch sender.tag {
		case 0:
			//doSomething
			break
		case 1:
			//doSomething
			break
		case 2:
			//doSomething
			
			break
		case 3:
			//doSomething
			let result = Helper.myHoroscope("21/06")
			break
		default:
			//doSomething
			break
		}
		
	}
	
}
