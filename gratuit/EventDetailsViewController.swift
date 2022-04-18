//
//  EventDetailsViewController.swift
//  gratuit
//
//  Created by Sohum Thadani on 4/14/22.
//

import UIKit
import Parse
import AlamofireImage

class EventDetailsViewController: UIViewController {
    
    var event: PFObject?
    
    var name: String = ""
    
    var descript: String = ""
    
    var location: String = ""
    
    var start: String = ""
    
    var end: String = ""
    
    var imageUrlString: String = ""

    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!
    
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var startTime: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(name)
        
        //print("entered")
        
        //print(event)
        
        //print(event!["eventName"] as! String)
        eventName.text = name
        
        //print("1")
        
        eventDescription.text = descript
        
        //print("2")
        
        eventLocation.text = location
        
        //print("3")
        
        endTime.text = end
        
        //print("4")
        
        startTime.text = start
        
        //let imageFile = event["eventImage"] as! PFFileObject
        let url = URL(string: imageUrlString)!
       
        imageView.af.setImage(withURL: url)
        
        //imageView.setImage(withURL: url)
        
        

        // Do any additional setup after loading the view.
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
