//
//  TableViewCell.swift
//  InsertingRowsInTableViews
//
//  Created by Akshay Jhamb on 19/02/19.
//  Copyright © 2019 Akshay Jhamb. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var NameOfEmployee: UILabel!
    @IBOutlet weak var DateOfJoining: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
