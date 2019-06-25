//
//  HoroscopeViewController.swift
//  LoveCalk
//
//  Created by Mac on 5/23/19.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var navBar: UINavigationBar!
    
   
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.selectionStyle = .none
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
     
        let ViewController = storyBoard.instantiateViewController(withIdentifier: "ResultHoroscopeViewController") as! ResultHoroscopeViewController
        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
    
    
    @IBOutlet var tableView: UITableView!
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
      
      
        
        
    }
    
    
    
    

}

class HoroscopeViewControllerCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
