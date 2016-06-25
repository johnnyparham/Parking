//
//  MapViewController.swift
//  Parking
//
//  Created by Magfurul Abeer on 6/25/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var manager = CLLocationManager()
    var parkingSpots = [CLLocationCoordinate2D]()
    
    
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        manager.delegate = self
        
        
        titleItem.title = "Parking Available"
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(menuButtonTapped))
        menuButton.tintColor = UIColor.whiteColor()
        
        self.titleItem.leftBarButtonItem = menuButton
        
        view.backgroundColor = UIColor(red: 12/255.0, green: 69/255.0, blue: 113/255.0, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 12/255.0, green: 69/255.0, blue: 113/255.0, alpha: 1)
        
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus().rawValue == 0 { // kCLAuthorizationStatusNotDetermined
                manager.requestAlwaysAuthorization()
            } else if CLLocationManager.authorizationStatus().rawValue == 3 { // kCLAuthorizationStatusAuthorizedAlways
                manager.requestLocation()
            }
        }
        
    }
    
    
    func menuButtonTapped() {
        
        print("menu button tapped")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    //MARK: MKMapViewDelegate Methods
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if !annotation.isEqual(mapView.userLocation) {
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.image = UIImage(named: "pin")
            return view
        }
        return nil
    }
    
    //MARK: CLLocationManagerDelegate Methods
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        //        print("\")
        if CLLocationManager.authorizationStatus().rawValue == 3 { // kCLAuthorizationStatusAuthorizedAlways
            manager.requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            var region = MKCoordinateRegion()
            region.center = location.coordinate
            region.span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            
            self.mapView.setRegion(region, animated: true)
            loadDummyData(location.coordinate)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error")
    }
    
    
    func loadDummyData(coordinate: CLLocationCoordinate2D) {
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2DMake(coordinate.latitude + 0.01, coordinate.longitude + 0.01)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2DMake(coordinate.latitude - 0.01, coordinate.longitude - 0.01)
        
        self.mapView.addAnnotations([annotation1, annotation2])
    }
    
}
