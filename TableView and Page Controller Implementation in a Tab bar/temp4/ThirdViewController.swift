//
//  ThirdViewController.swift
//  temp4
//
//  Created by Akshay Jhamb on 07/03/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
   override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        userName.text = FirstViewController.userData?.userName ?? "Empty"
        userImage.image = FirstViewController.userData?.imagePath ?? nil
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
