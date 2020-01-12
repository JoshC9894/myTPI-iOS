//
//  JCReportWP3ViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 20/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCReportWP3ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    var imagePicked = 0

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var label1: UILabel!

    @IBAction func button1tapped(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
        label1.text = ""
        
    }
    
    @IBAction func button2tapped(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
        label1.text = "1"
    }

    @IBAction func button3tapped(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
        label1.text = "2"
    }
    @IBAction func button4tapped(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
        label1.text = "3"
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        dateField.text = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
       if label1.text == ""{
        image1.image = pickedImage
        } else if (label1.text == "1") {
        image2.image = pickedImage
        } else if (label1.text == "2") {
            image3.image = pickedImage
            }else if (label1.text == "3") {
                image4.image = pickedImage}
    
        dismiss(animated: true, completion: nil)
    }
}
