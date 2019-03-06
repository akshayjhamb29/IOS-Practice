//
//  ViewController.swift
//  temp4
//
//  Created by Akshay Jhamb on 05/03/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class UserInfoCell: UITableViewCell{
    
    @IBOutlet weak var imagePlaceholder: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
   
    
    let imagePicker = UIImagePickerController()
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as! UserInfoCell
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.openGallery))
        
        cell.imagePlaceholder.addGestureRecognizer(recognizer)
        recognizer.numberOfTapsRequired = 1
        cell.imagePlaceholder.isUserInteractionEnabled = true
        cell.name.text = "Akshay"
        
        if let data = UserDefaults.standard.data(forKey: "savedImage") {
            cell.imagePlaceholder.image = UIImage(data: data as Data)
        }
        
        return cell
        
    }
    @objc func openGallery(){
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated:  true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let userimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let imageData = userimage.jpegData(compressionQuality: 1)!
        UserDefaults.standard.setValue(imageData, forKey: "savedImage")
        print("image found")
        self.imagePicker.dismiss(animated: true, completion: nil)
        
        self.tableView.reloadData()
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    
    
}

