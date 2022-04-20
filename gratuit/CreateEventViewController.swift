//
//  CreateEventViewController.swift
//  gratuit
//
//  Created by Sayam Kanwar on 28/03/22.
//

import UIKit
import AlamofireImage
import Alamofire
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
        
            let key : String = "AIzaSyB9yK-oJ1Dso6HroDWYUmzaigkVVmJ3TeE"
        let postParameters:[String: Any] = ["address": eventLocation.text ?? "Purdue University","key":key]
            let url : String = "https://maps.googleapis.com/maps/api/geocode/json"
        
        var latCoord : String = ""
        var lngCoord : String = ""

        if let imageData = imageView.image?.pngData() {
            let file = PFFileObject(name: "image.png", data: imageData)
            event["eventImage"] = file
        }
        else {
            let image = UIImage(named: "NotAvailable")
            let file = PFFileObject(name: "image.png", data: image!.pngData()!)
            event["eventImage"] = file
        }
        
            AF.request(url, method: .get,  parameters: postParameters, encoding: URLEncoding.default)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
//                            print(value["results"][0]["geometry"]["location"]["lat"].doubleValue)
//                            do {
//                                let jsonDictionary = try JSONSerialization.jsonObject(with: value!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]
//                            }
//                            catch {
//                                print("some errorrrr")
//                            }
//                            if let data = (value as AnyObject).results(using: .utf8) {
//                                if let json = try? JSON(data: data) {
//                                    print(json[0])
//                                }
//                            }
                            if let json = value as? [String: Any]{
                                if let jsonArray = json["results"] as? [[String:Any]],
                                   let result = jsonArray.first {
                                    if let geometry = result["geometry"] as? [String:Any] {
                                        if let location = geometry["location"] as? [String:Any] {
                                            print(location["lat"]!) // the value is an optional.
                                            print(location["lng"]!)
                                            latCoord = String(describing: location["lat"]!)
                                            lngCoord = String(describing: location["lng"]!)
                                            print("Latitude and Longitude:")
                                            print(latCoord)
                                            print(lngCoord)
                                            event["latitude"] = latCoord
                                            event["longitude"] = lngCoord
                                                event.saveInBackground { (success, error) in
                                                    if success {
                                                        self.dismiss(animated: true, completion: nil)
                                                    } else {
                                                        print("error in saving photo")
                                                    }
                                                }
                                        }
                                    }
                                }
                            }
                        case .failure(let error):
                            print(error)
                        }
            }
        
//            AF.request(url, method: .get, parameters: postParameters, encoding: URLEncoding.default, headers: nil).responseJSON {  response in
//
//                if let receivedResults = response.result.value
//                {
//                    let resultParams = receivedResults
//                    print(resultParams) // RESULT JSON
//                    print(resultParams["status"]) // OK, ERROR
//                    print(resultParams["results"][0]["geometry"]["location"]["lat"].doubleValue) // approximately latitude
//                    print(resultParams["results"][0]["geometry"]["location"]["lng"].doubleValue) // approximately longitude
//                }
//            }
            
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
