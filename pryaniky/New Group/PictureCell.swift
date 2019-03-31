//
//  PictureCell.swift
//  pryaniky
//
//  Created by Alexandra Gorshkova on 03/03/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {
    @IBOutlet weak var pictureText: UILabel!
    @IBOutlet weak var urlImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
