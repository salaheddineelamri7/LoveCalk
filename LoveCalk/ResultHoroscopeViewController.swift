//
//  ResultHoroscopeViewController.swift
//  LoveCalk
//
//  Created by Mac on 5/29/19.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit
import Alamofire



struct ContentHoroscope: Codable {
    let  date:String?
    let  horoscope:String?
    let  sunsign:String?
    
}

class ResultHoroscopeViewController: UIViewController {

    
    @IBOutlet var daySegmentedControl: UISegmentedControl!
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UITextView!
    
     let spinner = UIActivityIndicatorView()
   
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
        
        spinner(true)

        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        
        
        let url = Constants.getURL(value: "today")
        doGet(url: url)
        
        
        
        
    }
    
    func spinner(_ start:Bool) {
        
        if start {
            spinner.startAnimating()
            self.view.addSubview(spinner)
            spinner.center = view.center
        }else {
            spinner.stopAnimating()
            spinner.removeFromSuperview()
        }
        
    }
    
    
    func  setupViews(_ hroscope:ContentHoroscope) {
        
        if let hroscope = hroscope.horoscope {
            self.descriptionLabel.text = hroscope
        }
        if let sunsign = hroscope.sunsign {
            self.titleLabel.text = sunsign
        }
    }
    
    
    @IBAction func daySegmentedControlTapped(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            let url = Constants.getURL(value: "today")
            doGet(url: url)
        }else {
            let url = Constants.getURL(value: "week")
            doGet(url: url)
        }
        
    }
    
    
    func doGet(url:String) {
        
    
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            
            guard let data = data else {
                return
            }
            do {
                let hroscope = try JSONDecoder().decode(ContentHoroscope.self, from: data)
                
                DispatchQueue.main.async {
                    self.spinner(false)
                    self.setupViews(hroscope)
                }
                
            }catch let err {
                print(err)
            }
            
            }.resume()
    }

  

}
