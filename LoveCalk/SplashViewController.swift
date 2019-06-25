//
//  SplashViewController.swift
//  LoveCalk
//
//  Created by Mac on 5/15/19.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        

         timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    

    @objc func onTimerFires()
    {
        timer?.invalidate()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! ViewController
        self.navigationController?.pushViewController(ViewController, animated: true)
        
        
//        let ViewController = storyBoard.instantiateViewController(withIdentifier: "HoroscopeViewController") as! HoroscopeViewController
//        self.navigationController?.pushViewController(ViewController, animated: true)
    }
   

}
