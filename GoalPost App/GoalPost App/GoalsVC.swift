//
//  ViewController.swift
//  GoalPost App
//
//  Created by Akshay Jhamb on 13/03/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    @IBAction func addButtonPressed(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      
        
        
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalcell") as! GoalCellTableViewCell
        cell.configureCell(description: "Play Cricket Daily", type: .shortTerm, goalProgessAmount: 2)
    
        return cell
    }
}

