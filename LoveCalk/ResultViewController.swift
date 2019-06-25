//
//  ResultViewController.swift
//  LoveCalk
//
//  Created by Mahdi Boukhris on 18/03/2019.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var loveImageView: UILabel!
    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var pourcentageContainerView: UIView!
    @IBOutlet var shareButton: UIView!
    @IBOutlet var navBar: UINavigationBar!
    var percent:Int?
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    let shapeLayer = CAShapeLayer()
    
    let pourcentageLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Start"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 42)
        return label
    }()
    
    var timer:Timer?
    var timeLeft = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        
        let center = CGPoint(x: pourcentageContainerView.frame.width / 2, y: pourcentageContainerView.frame.height / 2)
        
        
        pourcentageContainerView.addSubview(pourcentageLabel)
        pourcentageLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        pourcentageLabel.center = center
        
        let strackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 120, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        strackLayer.path = circularPath.cgPath
        strackLayer.strokeColor = UIColor.white.cgColor
        strackLayer.lineWidth = 10
        strackLayer.fillColor = UIColor.clear.cgColor
        strackLayer.lineCap = kCALineCapRound
         strackLayer.position = center
        self.pourcentageContainerView.layer.addSublayer(strackLayer)
       
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor(red: 217/255, green: 14/255, blue: 61/255, alpha: 1).cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.position = center
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        self.pourcentageContainerView.layer.addSublayer(shapeLayer)
        
        
        
        shapeLayer.strokeEnd = 0
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        
        

        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        
//
       shareButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.shareButtonTapped)))
//
//        if let percent = percent {
//            percentLabel.text = "\(percent)%"
//        }
        
        shareButton.layer.cornerRadius =  shareButton.frame.height / 2
        
        
       
        
        
        
        
        
    }
    
    @objc func onTimerFires()
    {
        timeLeft += 0.01
        
        if Int(timeLeft * 100) == percent!  || Int(timeLeft * 100) == 100 {
            
            timer?.invalidate()
        }else {
            shapeLayer.strokeEnd = CGFloat(timeLeft)
        }
        
        pourcentageLabel.text = "\(Int(timeLeft * 100))%"
        
    }
    
    
    
    @objc private func handleTap(gesture:UITapGestureRecognizer) {
        
        
        
        
        //let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        basicAnimation.toValue = 1
//        basicAnimation.duration = 2
//        basicAnimation.fillMode = kCAFillModeForwards
//        basicAnimation.isRemovedOnCompletion = false
//        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @objc func shareButtonTapped(gesture:UITapGestureRecognizer){
 
            
        let items = [URL(string: "")!]
        
            let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
        
            self.present(activityViewController, animated: true, completion: nil)
        
    }

}
