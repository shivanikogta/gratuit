//
//  CreateEventViewController.swift
//  gratuit
//
//  Created by Sayam Kanwar on 28/03/22.
//

import UIKit
import AlamofireImage
import Parse

class CreateEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var eventName: UITextField!
    
    @IBOutlet weak var eventDescription: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        print("tapped submit")
            print("valid dates")
            let event = PFObject(className: "Event")
            event["eventID"] = NSUUID().uuidString
            event["eventName"] = eventName.text
            event["eventDescription"] = eventDescription.text
            event["eventLocation"] = eventLocation.text
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            
            event["startTime"] = formatter.string(from:datePicker.date)
            event["endTime"] = formatter.string(from:endDatePicker.date)
            event["creator"] = PFUser.current()!
            
            if let imageData = imageView.image?.pngData() {
                let file = PFFileObject(name: "image.png", data: imageData)
                event["eventImage"] = file
            }
            else {
                let image = UIImage(named: "NotAvailable")
                let file = PFFileObject(name: "image.png", data: image!.pngData()!)
                event["eventImage"] = file
            }
            
            event["latitude"] = String(22.2846)
            event["longitude"] = String(114.1581)
            
            event.saveInBackground { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("error in saving photo")
                }
            }
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
