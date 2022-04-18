//
//  EventsListViewController.swift
//  gratuit
//
//  Created by Sayam Kanwar on 28/03/22.
//

import UIKit
import Parse
import AlamofireImage

class EventsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var events = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("view did load finished")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Event")
        query.includeKeys(["eventName", "eventLocation", "startTime", "eventImage"])

        query.limit = 20
        
        print("view did appear entered")
        
        query.findObjectsInBackground{(events, error) in
            if events != nil {
                self.events = events!
                self.tableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(events)
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        let event = events[indexPath.row]
        cell.eventName.text = event["eventName"] as! String
        cell.eventTime.text = event["startTime"] as! String
        // cell.eventLocation.text = event["eventLocation"] as! String
        
        let imageFile = event["eventImage"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af.setImage(withURL: url)
        print("here")
        print(cell)
        return cell
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
