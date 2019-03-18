//
//  ViewController.swift
//  LoveCalk
//
//  Created by Mahdi Boukhris on 15/03/2019.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet  weak var _firstNameMen: UITextField!
	@IBOutlet  weak var _firstNameWomen: UITextField!
	@IBOutlet weak var _validButton: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
	setupCustomTextField()
	  setupCustomButton()
	}
	
	fileprivate func setupCustomTextField() {
		
		let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: _firstNameMen.frame.height))
		let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: _firstNameWomen.frame.height))
		
		
		_firstNameMen.leftView = paddingView
		
		_firstNameMen.leftViewMode = UITextFieldViewMode.always
		
		_firstNameMen.layer.cornerRadius = 5.0
		_firstNameMen.layer.borderWidth = 1.5
		
		_firstNameMen.layer.borderColor = UIColor(red: 205/255, green: 214/255, blue: 221/255, alpha: 1).cgColor
		_firstNameMen.layer.borderWidth = 2
		
		_firstNameWomen.leftView = paddingView1

		_firstNameWomen.leftViewMode = UITextFieldViewMode.always

		_firstNameWomen.layer.cornerRadius = 5.0
		_firstNameWomen.layer.borderWidth = 1.5

		_firstNameWomen.layer.borderColor = UIColor(red: 205/255, green: 214/255, blue: 221/255, alpha: 1).cgColor
		_firstNameWomen.layer.borderWidth = 2
		
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = true
	}
	
	fileprivate func setupCustomButton(){
		_validButton.layer.cornerRadius = 5.0
		_validButton.layer.borderWidth = 1.0
		_validButton.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
	}
	
	@IBAction func validerButtonTapped(_ sender:UIButton) {
		
		let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		
		let resultViewController = storyBoard.instantiateViewController(withIdentifier: "resultViewController") as! ResultViewController
		self.navigationController?.isNavigationBarHidden = false
		self.navigationController?.pushViewController(resultViewController, animated: true)
		
		
		
		
		
	}



}

