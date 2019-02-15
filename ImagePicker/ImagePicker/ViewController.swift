//
//  ViewController.swift
//  ImagePicker
//
//  Created by Akshay Jhamb on 15/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var img: UIImageView!
    
    var imagepicker  = UIImagePickerController()
    
    @IBAction func onClickPickImage(_ sender: Any) {
        imagepicker.sourceType = .photoLibrary
        imagepicker.allowsEditing = true
        present(imagepicker, animated: true, completion: nil)
       
    }
    
    @IBAction func pickImageFromCamera(_ sender: Any) {
        imagepicker.sourceType = .camera
        imagepicker.allowsEditing = true
        present(imagepicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            img.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
         imagepicker.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

