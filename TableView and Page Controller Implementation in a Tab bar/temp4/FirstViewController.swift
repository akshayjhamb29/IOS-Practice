//
//  ViewController.swift
//  temp4
//
//  Created by Akshay Jhamb on 05/03/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class UserInfoCell: UITableViewCell{
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userName: UITextField!
    
    
}

class EmployeeInfoCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet weak var nameOfEmployee: UITextField!
    
    @IBOutlet weak var joiningDate: UITextField!
    
}



class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {
    
    let sections = ["Add User Details","Add Employee Details"]
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let empInfo = EmployeeInfoCell()
    
    
    
    
    var namesArray = [String]()
    var dateArray  = [String]()
    
    let imagePicker = UIImagePickerController()
    let datePicker = UIDatePicker()
    
    static var userData : UserDataModel?
    static var fileURL : UIImage?
    static var employeesData : [EmployeeDataModel] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else {
            return  FirstViewController.employeesData.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell" ,for: indexPath ) as! UserInfoCell
            cell.userName?.delegate = self
            cell.userName.text = FirstViewController.userData?.userName
            cell.userName.tag = 0
            
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.openGallery))
            
            cell.userProfileImage.addGestureRecognizer(recognizer)
            recognizer.numberOfTapsRequired = 1
            cell.userProfileImage.isUserInteractionEnabled = true
            
            
            
            cell.userProfileImage.image = UIImage(named: "user-33638__340.jpg")
            if let data = UserDefaults.standard.data(forKey: "savedImage")
            {
                cell.userProfileImage.image = UIImage(data: data as Data)
                cell.userProfileImage.layer.cornerRadius = (cell.userProfileImage.frame.size.width)/2
                cell.userProfileImage.layer.borderWidth = 4
                cell.userProfileImage.layer.borderColor = UIColor.black.cgColor
                cell.userProfileImage.clipsToBounds = true
                FirstViewController.fileURL = UIImage(data: data as Data)
                print(FirstViewController.userData as Any)
            }
            if let personName =  cell.userName.text {
                FirstViewController.userData = UserDataModel(userName: personName ,imagePath: FirstViewController.fileURL)
            }
            return cell
            
            
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeInfoCell",for: indexPath) as! EmployeeInfoCell
            cell.nameOfEmployee?.delegate = self
            cell.joiningDate!.delegate = self
//            cell.joiningDate!.text = dateArray[indexPath.row]
//
//            cell.nameOfEmployee?.text = namesArray[indexPath.row]
            cell.joiningDate!.text = FirstViewController.employeesData[indexPath.row].employeeDate
             cell.nameOfEmployee?.text = FirstViewController.employeesData[indexPath.row].employeeName
            print("-----------")
            print("Original Tags")
            cell.joiningDate.tag =  indexPath.row
            cell.nameOfEmployee.tag = indexPath.row
            print(cell.nameOfEmployee.tag)
            print(cell.joiningDate.tag)
            print("-----------")
            print("modified Tags")
            cell.nameOfEmployee.tag = (1 + indexPath.row) * -1
            cell.joiningDate.tag =  1 + indexPath.row
            
            print(cell.nameOfEmployee.tag)
            print(cell.joiningDate.tag)
            
            return cell
        }
        
        
        
    }
    
    
    
    @objc func openGallery(){
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated:  true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        UserDefaults.standard.removeObject(forKey: "savedImage")
        let userimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let imageData = userimage.jpegData(compressionQuality: 1)!
        UserDefaults.standard.setValue(imageData, forKey: "savedImage")
        
        
        print("image found")
        self.imagePicker.dismiss(animated: true, completion: nil)
        
        self.tableView.reloadData()
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Editing is about to begin")
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor =  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        print("Editing is began")
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Editing ended")
        
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor.white
        var nameTag : Int
        var dateTag : Int
        if (textField.tag < 0){
            
            print("edited name item tag")
            print(textField.tag)
            print("name array item got edited")
            nameTag = (textField.tag * -1)
            nameTag = nameTag - 1
            print(nameTag)
            
            
//            namesArray[nameTag] = textField.text!
            FirstViewController.employeesData[nameTag].employeeName = textField.text!

            

        }
        else if (textField.tag > 0){
            print("edited Date item Tag")
            print(textField.tag)
            print("date array item got edited")
            dateTag = textField.tag
            dateTag = dateTag - 1
            print(dateTag)
            
//            dateArray[dateTag] = textField.text!
            
            FirstViewController.employeesData[dateTag].employeeDate = textField.text!
//
        }
        else {
            print(textField.tag)
            print("UserName Got edited")
            FirstViewController.userData?.userName = textField.text
            print(FirstViewController.userData?.userName! ?? "")
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        textField.backgroundColor = UIColor.white
        
        
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height:CGFloat = CGFloat()
        if indexPath.section == 0 {
            height = 258
        }
        if indexPath.section == 1{
            height = 64
        }
      
        return height
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 250))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 20, y: -85, width: headerView.frame.width, height: headerView.frame.height - 20 )
            label.text = "Employee Details"
            
            label.textColor = .black
            headerView.backgroundColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            headerView.addSubview(label)
            
            return headerView
        }
        else {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 0))
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1{
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
            footerView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            let button = UIButton.init(type: .system)
            button.frame = CGRect(x: 135, y: 10.0, width: tableView.frame.size.width - 280, height: footerView.frame.size.height - 30)
            button.setTitle("Add Employee", for: .normal)
            
            button.backgroundColor = .black
            button.layer.borderWidth = 1.0
            button.tintColor = .white
            button.layer.cornerRadius = 10.0
            button.titleLabel?.textColor = .orange
            button.addTarget(self, action: #selector(addEmployeeData),for: .touchUpInside)
            
            
            footerView.addSubview(button)
            return footerView
        }
        else
        {
            let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width:0, height: 0))
            return footerView
        }
        
    }
    @objc func addEmployeeData(sender: UIButton!) {
        
        print("Button tapped")
          let dataCount = FirstViewController.employeesData.count

//        }
        if (FirstViewController.employeesData.count == 0)
        {
            FirstViewController.employeesData.append(EmployeeDataModel(employeeName: "", employeeDate: ""))
            tableView.reloadData()
        }
        

        if (dataCount > 0){
            if ((FirstViewController.employeesData[dataCount - 1].employeeName != "") && (FirstViewController.employeesData[dataCount - 1].employeeDate != "")){
                FirstViewController.employeesData.append(EmployeeDataModel(employeeName: "", employeeDate: ""))
                tableView.reloadData()
            }
        }

        print("Data Passed Count")
        print(FirstViewController.employeesData.count)
        print(FirstViewController.employeesData)
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1{
            return 40
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return 60
        }
        else {
            return 0
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstViewController.userData = nil
        imagePicker.delegate = self
        tableView.tableFooterView = UIView()
        
    }
    
    
    
}



