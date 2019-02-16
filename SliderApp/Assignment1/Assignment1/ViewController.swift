//
//  ViewController.swift
//  Assignment1
//
//  Created by Akshay Jhamb on 11/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt: UITextField!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
    txt.text = String(Int(sender.value))
    }
    
    @IBAction func changeValue(_ sender: UIButton) {
        
        let textfieldint = Int(txt.text!)!
        guard textfieldint >= 0 && textfieldint <= 100 else {
            showAlert("Please enter value in range 0..100")
            return
        }
        slider.value = Float(textfieldint)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt.text = String(Int(slider.value))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func showAlert(_ errorMessage: String) {
        let alertController = UIAlertController()
        alertController.message = errorMessage
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }


}

