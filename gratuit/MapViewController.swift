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
    
    var currEvent: PFObject!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        print("view did load entered")
        
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
        
        print("view did appear entered")
        
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Event")
        query.includeKeys(["eventID", "eventName", "eventDescription", "eventLocation", "startTime", "endTime", "creator", "latitude", "longitude"])

    
        query.findObjectsInBackground { (info, error) in
            
            if info != nil {
                
                for item in info! {
                    self.events.append(item)
                }
                
                for event in self.events {
                    
                    print("for loop entered")
                    
                    // replace position later with variables
                    if let latit = Double(event["latitude"] as! String), let longit = Double(event["longitude"] as! String) {
                        
                        let position = CLLocationCoordinate2D(latitude: latit, longitude: longit)
                        let marker = GMSMarker(position: position)
                        marker.title = event["eventName"] as! String
                        marker.map = self.mapView
                    }
                    
                }
            }
        }
        
        print(self.events)
        
        
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
                                                      zoom: 18.0)
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
    
    func mapView(_ mapView: GMSMapView!, didTap marker: GMSMarker!) -> Bool {
        
        print("tapped")
        
        for event in events {
            
            // replace with position variables later
        
            
            if let latit = Double(event["latitude"] as! String), let longit = Double(event["longitude"] as! String) {
                
                let location = CLLocationCoordinate2D(latitude: latit, longitude: longit)
                
                if (location.latitude == marker.position.latitude
                    && location.longitude == marker.position.longitude) {
                    
                    self.currEvent = event
                    
                    //print(event)
                    
                    performSegue(withIdentifier: "transitionToDetails", sender: self)
                    
                    break
                }
            }

            
        }
        
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "transitionToDetails"){
            let displayVC = segue.destination as! EventDetailsViewController
            
            print(currEvent)
            
            displayVC.name = (currEvent["eventName"] as? String)!
            
            displayVC.descript = (currEvent["eventDescription"] as? String)!
            
            displayVC.location = (currEvent["eventLocation"] as? String)!
            
            displayVC.end = (currEvent["endTime"] as? String)!
            
            displayVC.start = (currEvent["startTime"] as? String)!
            
            
            let imageFile = currEvent["eventImage"] as! PFFileObject
            
            displayVC.imageUrlString = imageFile.url!
            
        }
        
        
    }
    
    

}
