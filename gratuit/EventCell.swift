//
//  EventCell.swift
//  gratuit
//
//  Created by Rohan Purandare on 4/18/22.
//

import UIKit
import Parse

class EventCell: UITableViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var starButton: UIButton!
    
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var starred:Bool = false;
    var event = PFObject();
    
    func setParam(_ inputEvent:PFObject) {
        event = inputEvent
    }
    
    func setStarred(_ isStarred:Bool) {
        starred = isStarred
        if (starred) {
            print("starred")
            starButton.setImage(UIImage(named: "Star filled"), for: UIControl.State.normal)
            event["starred"] = "True"
        }
        else {
            print("not starred")
            starButton.setImage(UIImage(named: "Star unfilled"), for: UIControl.State.normal)
            event["starred"] = "False"
        }
    }
    
    @IBAction func starEvent(_ sender: Any) {
        setStarred(!starred)
    }
}
