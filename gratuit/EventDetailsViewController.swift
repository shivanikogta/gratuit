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

    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!
    
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("entered")
        
        eventName.text = event!["eventName"] as! String
        
        print("1")
        
        eventDescription.text = event?["eventDescription"] as? String
        
        print("2")
        
        eventLocation.text = event?["eventLocation"] as? String
        
        print("3")
        
        endTime.text = event?["endTime"] as? String
        
        print("4")
        
        startTime.text = event?["startTime"] as? String
        
        //let imageFile = event["eventImage"] as! PFFileObject
        //let urlString = imageFile.url!
        //let url = URL(string: urlString)!
        
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
