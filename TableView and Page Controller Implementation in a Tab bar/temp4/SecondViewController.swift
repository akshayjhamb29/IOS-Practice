//
//  SecondViewController.swift
//  temp4
//
//  Created by Akshay Jhamb on 07/03/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView : UIScrollView!
    
    
    
    var frame = CGRect(x:0, y:0, width: 0, height:0)
            var thelabels = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.reloadInputViews()
//        theLabel.text = "Add some entries in Table"
//        theLabel.textColor = .white
//        theLabel.textAlignment = .center

        for _ in 0..<FirstViewController.employeesData.count{
            let label = UILabel()
            thelabels.append(label)
            view.addSubview(label)
        }
       
       
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
   
        print(FirstViewController.employeesData.count)
        configurePageDisplay()
        super.viewWillAppear(animated)
        
    }
    
    func configurePageDisplay(){
        for _ in 0..<FirstViewController.employeesData.count{
            let label = UILabel()
            thelabels.append(label)
            view.addSubview(label)
        }
         print(FirstViewController.employeesData.count)
        let passedDataCount = FirstViewController.employeesData.count
        if (passedDataCount > 0){
            if ((FirstViewController.employeesData[passedDataCount - 1].employeeName == "") || (FirstViewController.employeesData[passedDataCount - 1].employeeDate == ""))
            {
                FirstViewController.employeesData.remove(at: passedDataCount - 1)
        }
        }
        
//        var employeeInfo = UILabel()
        
     
        pageControl.numberOfPages = FirstViewController.employeesData.count
        for index in 0..<FirstViewController.employeesData.count{
            frame.origin.x  = scrollView.frame.size.width
                * CGFloat(index)
            frame.size = scrollView.frame.size
            thelabels[index].frame = frame
            thelabels[index].textAlignment = .center
            
            thelabels[index].text = FirstViewController.employeesData[index].employeeName! + "  " +  FirstViewController.employeesData[index].employeeDate!
            thelabels[index].textColor = .white
            thelabels[index].textAlignment = .center
        
            self.scrollView.addSubview(thelabels[index])
          
            
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(FirstViewController.employeesData.count), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }

    
}


