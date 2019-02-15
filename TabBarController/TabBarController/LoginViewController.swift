//
//  LoginViewController.swift
//  TabBarController
//
//  Created by Akshay Jhamb on 15/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LoginTapped(_ sender : Any)
    {
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[0]
    present(mainTabController, animated: true, completion: nil)
        
    }
    
    
}
