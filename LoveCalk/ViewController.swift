//
//  ViewController.swift
//  LoveCalk
//
//  Created by Mahdi Boukhris on 15/03/2019.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit
import GoogleMobileAds
class ViewController: UIViewController {
	
    @IBOutlet var womenContainerView: UIView!
    @IBOutlet var homeContainerView: UIView!
    @IBOutlet  weak var _firstNameMen: UITextField!
	@IBOutlet  weak var _firstNameWomen: UITextField!
	@IBOutlet weak var _validButton: UIButton!
	
    var bannerView: GADBannerView!

    var interstitial: GADInterstitial!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
        
 
        
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        addBannerViewToView(bannerView)

		
		setupCustomTextField()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
      
	}
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }

    
    
    @objc func dismissKeyboard(sender:UITapGestureRecognizer) {
        view.endEditing(true)
    }
	
	fileprivate func setupCustomTextField() {
		
        
        homeContainerView.layer.cornerRadius =  homeContainerView.frame.height / 2
        womenContainerView.layer.cornerRadius =  womenContainerView.frame.height / 2
       
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = true
        
        interstitial = GADInterstitial(adUnitID: "")
        let request = GADRequest()
        interstitial.load(request)
	}
	
    @objc func keyboardWillShow(_ notification: Notification)  {
        
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight =  keyboardSize.height
            
            
            self.view.bounds.origin.y =  keyboardHeight
            
            
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight =  keyboardSize.height
            
            self.view.bounds.origin.y = 0
            
            print(keyboardHeight)
        }
    }

	
	@IBAction func validerButtonTapped(_ sender:UIButton) {
    
        view.endEditing(true)
        
        
        
        guard let _firstNameMen = _firstNameMen.text, _firstNameMen.count > 0 else {
            showAlertSimple(title: "", message: "Enter your name")
            return
        }
        
        guard let _firstNameWomen = _firstNameWomen.text, _firstNameWomen.count > 0 else {
            showAlertSimple(title: "", message: "Enter your name")
            return
        }
        
         let percent = calculLove(men: _firstNameMen, women: _firstNameWomen)
        
        
		let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
       
		
		let resultViewController = storyBoard.instantiateViewController(withIdentifier: "resultViewController") as! ResultViewController
        resultViewController.percent = percent
		self.navigationController?.isNavigationBarHidden = false
		self.navigationController?.pushViewController(resultViewController, animated: true)
		
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }


		
	}
    
    fileprivate func calculLove(men:String,women:String) -> Int {
        
        let _men = men.uppercased()
        let _women = women.uppercased()
        let character = _men+_women //cap
        
        var sum = 0
        for c in  character {
            sum += c.asciiValue
            
        }
        
    
        return sum%101
        
    }
    
    func showAlertSimple(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    



}

extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

