//
//  SelectorCell.swift
//  pryaniky
//
//  Created by Alexandra Gorshkova on 03/03/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit
//import BEMCheckBox

class SelectorCell: UITableViewCell {

 
    @IBOutlet weak var selectorText: UILabel!
    @IBOutlet weak var selectorText2: UILabel!
    @IBOutlet weak var selectorText3: UILabel!
    
    @IBOutlet weak var chek: UISwitch!
    @IBOutlet weak var chek2: UISwitch!
    @IBOutlet weak var chek3: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
