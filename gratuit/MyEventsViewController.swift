//
//  EventsListViewController.swift
//  gratuit
//
//  Created by Sayam Kanwar on 28/03/22.
//

import UIKit
import Parse
import AlamofireImage

class MyEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let starUnfilled = UIImage(systemName: "star")
    let starFilled = UIImage(systemName: "star.fill")
    
    var events = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 139
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Event")
        query.includeKeys(["eventName", "eventLocation", "startTime", "eventImage", "starred"])

        query.limit = 20
                
        query.findObjectsInBackground{(events, error) in
            if events != nil {
                self.events = events!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let event = events[indexPath.row]
//        let isStarred = event["starred"] as! Bool
//        var counter = 0
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
//        if (isStarred) {
//            //let event = events[indexPath.row]
//            let dateTime = event["startTime"] as! String
//            let timeComponents = dateTime.components(separatedBy: ", ")
//            let date = timeComponents[0]
//            let startTime = timeComponents[1]
//            let endDateTime = event["endTime"] as! String
//            let endTimeComponents = endDateTime.components(separatedBy: ", ")
//            let endTime = endTimeComponents[1]
//            let time = startTime + " - " + endTime
//            cell.eventName.text = event["eventName"] as! String
//            cell.eventTime.text = time
//            cell.eventLocation.text = event["eventLocation"] as! String
//            cell.date.text = date
//            let imageFile = event["eventImage"] as! PFFileObject
//            let urlString = imageFile.url!
//            let url = URL(string: urlString)!
//
//            cell.photoView.af.setImage(withURL: url)
//        }
        return cell
//        counter += 1
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
