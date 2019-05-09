//
//  ResultViewController.swift
//  LoveCalk
//
//  Created by Mahdi Boukhris on 18/03/2019.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var shareButton: UIView!
    @IBOutlet var navBar: UINavigationBar!
    var percent:Int?
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        shareButton.layer.cornerRadius =  shareButton.frame.height / 2
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        self.navigationController?.isNavigationBarHidden = true
        
        shareButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.shareButtonTapped)))
        
        if let percent = percent {
            percentLabel.text = "\(percent)%"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @objc func shareButtonTapped(gesture:UITapGestureRecognizer){
 
            
            let myApp = NSURL(string:"")
            let share = [myApp]
            let activityViewController = UIActivityViewController(activityItems: share, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        
    }

}
