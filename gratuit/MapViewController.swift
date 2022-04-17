//
//  MapViewController.swift
//  gratuit
//
//  Created by Sayam Kanwar on 28/03/22.
//

import UIKit
import CoreLocation
import GoogleMaps
import Parse

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var events = [PFObject]()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.

        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self

        // Do any additional setup after loading the view.
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Events")
        query.includeKeys(["eventID", "eventName", "eventDescription", "eventLocation", "startTime", "endTime", "creator"])

    
        query.findObjectsInBackground { (events, error) in
            if events != nil {
                self.events = events!
            }
        }
        
        for event in events {
            
            // replace position later with variables
            if let latit = Double(event["latitude"] as! String), let longit = Double(event["longit"] as! String) {
                
                let position = CLLocationCoordinate2D(latitude: latit, longitude: longit)
                let marker = GMSMarker(position: position)
                marker.title = event["eventName"] as! String
                marker.map = mapView
            }
            
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations.last)
        
        let location = locations.last
        
        
        /* Set Marker Position of User - Later include for loop for adding all the markers from PFObject here
        let marker = GMSMarker(position: location!.coordinate)
        marker.title = "User Location"
        marker.map = mapView */
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!,
                                                      longitude: (location?.coordinate.longitude)!,
                                                      zoom: 25.0)
        mapView.camera = camera
        
        mapView.animate(to: camera)
    }

    @IBAction func onAddEvent(_ sender: Any) {
        performSegue(withIdentifier: "goToCreateEvents", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onLogoutButton(_ sender: Any) {
        print("logout")
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        delegate.window?.rootViewController = LoginViewController
    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        
        print("tapped")
        
        for event in events {
            
            // replace with position variables later
            
            let location = CLLocationCoordinate2D(latitude: 10, longitude: 10)
            
            if (location.latitude == marker.position.latitude
                && location.longitude == marker.position.longitude) {
                
                // let sender: PFObject = event
                
                // performSegue(withIdentifier: "goToCreateEvents", sender: sender)
                
                break
            }
            
        }
        
        
        return true
    }
    
    

}
