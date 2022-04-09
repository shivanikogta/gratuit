//
//  MapViewController.swift
//  gratuit
//
//  Created by Sayam Kanwar on 28/03/22.
//

import UIKit
import CoreLocation
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.

        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations.last)
        
        let location = locations.last
        
        
        // Set Marker Position of User - Later include for loop for adding all the markers from PFObject here
        let marker = GMSMarker(position: location!.coordinate)
        marker.title = "User Location"
        marker.map = mapView
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!,
                                                      longitude: (location?.coordinate.longitude)!,
                                                      zoom: 25.0)
        mapView.camera = camera
        
        mapView.animate(to: camera)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
