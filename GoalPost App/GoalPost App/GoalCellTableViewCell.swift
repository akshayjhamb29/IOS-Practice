//
//  GoalCellTableViewCell.swift
//  GoalPost App
//
//  Created by Akshay Jhamb on 13/03/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class GoalCellTableViewCell: UITableViewCell {

    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
   
    func configureCell(description: String, type:GoalType, goalProgessAmount: Int)
    {
    
    self.goalDescription.text = description
    self.goalTypeLabel.text = type.rawValue
    self.goalProgress.text = String(describing: goalProgessAmount)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
