//
//  ViewController.swift
//  ImagePicker(TapGesture)
//
//  Created by Akshay Jhamb on 17/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

       @IBOutlet weak var imageView: UIImageView!
    @IBAction func tapToAddPhoto(sender: UITapGestureRecognizer){
        let imageController = UIImagePickerController()
        imageController.sourceType = .photoLibrary
        imageController.delegate = self
        present(imageController,animated: true, completion:  nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let photo = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = photo
        dismiss(animated: true, completion: nil)
    }
}
//    var picker:UIImagePickerController?=UIImagePickerController()

//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("tapGesture:")))
//        imageView.addGestureRecognizer(tapGesture)
//        imageView.isUserInteractionEnabled = true
//        picker?.delegate=self
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    func tapGesture(gesture: UIGestureRecognizer) {
//        let alert:UIAlertController=UIAlertController(title: "Profile Picture Options", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
//
//        let gallaryAction = UIAlertAction(title: "Open Gallary", style: UIAlertAction.Style.default)
//        {
//            UIAlertAction in self.openGallary()
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
//        {
//            UIAlertAction in self.cancel()
//
//        }
//
//        alert.addAction(gallaryAction)
//        alert.addAction(cancelAction)
//
//
//        self.present(alert, animated: true, completion: nil)
//
//    }
//    func openGallary()
//    {
//        picker!.allowsEditing = false
//        picker!.sourceType = UIImagePickerController.SourceType.photoLibrary
//        present(picker!, animated: true, completion: nil)
//    }
//
//
//    func cancel(){
//        print("Cancel Clicked")
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//
//    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = chosenImage
//        dismiss(animated: true, completion: nil)
//    }
//
//}

