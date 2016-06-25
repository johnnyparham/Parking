
//
//  MainViewController.swift
//  Parking
//
//  Created by Magfurul Abeer on 6/25/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit
import QuartzCore

class MainViewController: UIViewController {
    
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var king: UILabel!
    @IBOutlet weak var par: UILabel!
    @IBOutlet weak var car: UIImageView!
    @IBOutlet weak var bubble: UIImageView!
    @IBOutlet weak var reportButtonFullWidth: NSLayoutConstraint!
    @IBOutlet weak var reportButtonRegularWidth: NSLayoutConstraint!
    @IBOutlet weak var findButtonFullWidth: NSLayoutConstraint!
    @IBOutlet weak var findButtonRegularWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonBorders()
        setUpBubbleConstraints()
        
        car.transform = CGAffineTransformMakeTranslation(-self.view.frame.width, 0)
        king.transform = CGAffineTransformMakeTranslation(-self.view.frame.width, 0)
        par.transform = CGAffineTransformMakeTranslation(-self.view.frame.width, 0)
        bubble.alpha = 0
        findButton.alpha = 0
        reportButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, delay: 0.6, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.par.transform = CGAffineTransformIdentity
            self.king.transform = CGAffineTransformIdentity
            self.findButton.alpha = 1
            self.reportButton.alpha = 1
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.car.transform = CGAffineTransformIdentity
        }) { (bool) in
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                
                self.bubble.alpha = 1.0
                }, completion: { (bool) in
            })
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        car.transform = CGAffineTransformMakeTranslation(-self.view.frame.width, 0)
        king.transform = CGAffineTransformMakeTranslation(-self.view.frame.width, 0)
        par.transform = CGAffineTransformMakeTranslation(-self.view.frame.width, 0)
        bubble.alpha = 0
    }
    
    func addButtonBorders() {
        findButton.layer.borderWidth = 2.0
        findButton.layer.borderColor = UIColor.whiteColor().CGColor
        findButton.layer.cornerRadius = 30.0
        reportButton.layer.borderWidth = 2.0
        reportButton.layer.borderColor = UIColor.whiteColor().CGColor
        reportButton.layer.cornerRadius = 30.0
    }
    
    func setUpBubbleConstraints() {
        bubble.translatesAutoresizingMaskIntoConstraints = false
        bubble.heightAnchor.constraintEqualToAnchor(car.heightAnchor, multiplier: 0.5).active = true
        bubble.widthAnchor.constraintEqualToAnchor(car.widthAnchor, multiplier: 0.5).active = true
        bubble.topAnchor.constraintEqualToAnchor(car.topAnchor).active = true
        bubble.leftAnchor.constraintEqualToAnchor(car.centerXAnchor).active = true
    }
    
    
    //    func menuButtonTapped(sender: UIBarButtonItem) {
    //
    //    }
    
    
    @IBAction func findParkingButtonTapped(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.findButton.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height)
            
        }) { (bool) in
            
        }
        
        UIView.animateWithDuration(0.3, animations: {
            self.findButtonRegularWidth.active = false
            self.findButtonFullWidth.active = true
            self.view.layoutIfNeeded()
        }) { (bool) in
            self.performSegueWithIdentifier("FindParkingSegue", sender: nil)
        }
        
    }
    
    @IBAction func reportParkingButtonTapped(sender: UIButton) {
        UIView.animateWithDuration(0.3, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.reportButton.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height)
            
        }) { (bool) in
            
        }
        
        UIView.animateWithDuration(0.5, animations: {
            self.reportButtonRegularWidth.active = false
            self.reportButtonFullWidth.active = true
            self.view.layoutIfNeeded()
        }) { (bool) in
            self.performSegueWithIdentifier("FindParkingSegue", sender: nil)
        }
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
