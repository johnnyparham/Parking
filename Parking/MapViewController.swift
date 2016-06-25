//
//  MapViewController.swift
//  Parking
//
//  Created by Magfurul Abeer on 6/25/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var manager = CLLocationManager()

    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleItem.title = "test"
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(menuButtonTapped))
        
//        navbar.items = ]

        view.backgroundColor = UIColor(red: 12/255.0, green: 69/255.0, blue: 113/255.0, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 12/255.0, green: 69/255.0, blue: 113/255.0, alpha: 1)
    }
    
    
    func menuButtonTapped() {
        print("menu button tapped")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}
