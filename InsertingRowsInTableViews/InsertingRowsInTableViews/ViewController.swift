//
//  ViewController.swift
//  InsertingRowsInTableViews
//
//  Created by Akshay Jhamb on 19/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var employeeName: UITextField!
    
    @IBOutlet weak var joiningDate: UITextField!
    
  
    @IBOutlet weak var tableView: UITableView!
    
    let datePicker = UIDatePicker()
    var array = [String]()
    var array1 = [String]()
    
    @IBAction func InsertBtn(_sender: Any)
    {
        if employeeName.text != ""{
            array.append(employeeName.text!)
            
            employeeName.text = ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        joiningDate.text = formatter.string(from: datePicker.date)
     
        array1.append(joiningDate.text!)
        //joiningDate.text = formatter.string(from: datePicker.date)
        
        tableView.reloadData()
        joiningDate.text = ""
    }
    
    @objc func DoneBtn(_sender: Any)
    {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        joiningDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        
        
        showDatePicker()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! TableViewCell
        
        cell.NameOfEmployee.text = array[indexPath.row]
        cell.DateOfJoining.text = array1[indexPath.row]
        
        
        
        return cell
        
    }
    
  
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DoneBtn));
         toolbar.setItems([doneButton], animated: true)
       
        
        joiningDate.inputAccessoryView = toolbar
       joiningDate.inputView = datePicker
        
    }
    
    
   
}

