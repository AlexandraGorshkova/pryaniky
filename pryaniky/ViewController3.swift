//
//  ViewController3.swift
//  pryaniky
//
//  Created by Alexandra Gorshkova on 06/03/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var name3: UILabel!
    var textOfLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name3.text = textOfLabel
    }
}
