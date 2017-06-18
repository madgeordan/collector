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
    
    @IBOutlet weak var addUPDButton: UIButton!
    
    @IBAction func addButton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let collection = Collection(context: context)
        collection.name = nameField.text
        collection.picture = UIImagePNGRepresentation(imageView.image!)! as NSData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    var collection: Collection? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if collection != nil {
            
            if let imageData = collection?.picture as Data? {
                if let image = UIImage(data: imageData) {
                    imageView.image = image
                }
            }
            nameField.text = collection?.name
            addUPDButton.setTitle("rename", for: .normal)
            addUPDButton.setTitleColor(UIColor.black, for: .normal)
        } else {
            print("NO COLLECTION!")
        }
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
