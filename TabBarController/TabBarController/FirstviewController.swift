//
//  FirstviewController.swift
//  TabBarController
//
//  Created by Akshay Jhamb on 15/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class FirstViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func logout(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
}
