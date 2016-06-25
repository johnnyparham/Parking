
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonBorders()
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(menuButtonTapped(_:)))
        self.navigationItem.leftBarButtonItem = menuButton
        
//        let
    }

    func addButtonBorders() {
        findButton.layer.borderWidth = 2.0
        findButton.layer.borderColor = UIColor.whiteColor().CGColor
        findButton.layer.cornerRadius = 30.0
        reportButton.layer.borderWidth = 2.0
        reportButton.layer.borderColor = UIColor.whiteColor().CGColor
        reportButton.layer.cornerRadius = 30.0
    }
    
    
    func menuButtonTapped(sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func findParkingButtonTapped(sender: UIButton) {
        performSegueWithIdentifier("FindParkingSegue", sender: nil)
    }
    
    @IBAction func reportParkingButtonTapped(sender: UIButton) {
        
    }
    

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
