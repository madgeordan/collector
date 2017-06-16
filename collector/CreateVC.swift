//
//  CreateVC.swift
//  collector
//
//  Created by George Lushch on 6/16/17.
//  Copyright © 2017 madgeordan. All rights reserved.
//

import UIKit

class CreateVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func cameraButton(_ sender: Any) {
        print("cam")
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        print("add")
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    @IBAction func photosButton(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
