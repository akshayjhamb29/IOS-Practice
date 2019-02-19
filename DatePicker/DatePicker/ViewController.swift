//
//  ViewController.swift
//  DatePicker
//
//  Created by Akshay Jhamb on 19/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UITextField!
    
    let dateSelector = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       createDatePicker()
    }

    func createDatePicker(){
        
        dateSelector.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClicked));

        
        toolbar.setItems([doneButton], animated: false)
        
        datePicker.inputAccessoryView = toolbar
        datePicker.inputView = dateSelector
    }
    @objc func doneClicked(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        datePicker.text = dateFormatter.string(from: dateSelector.date)
        self.view.endEditing(true)
    }

}

