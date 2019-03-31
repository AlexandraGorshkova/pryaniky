//
//  ViewController.swift
//  pryaniky
//
//  Created by Alexandra Gorshkova on 03/03/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    var textOfLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = textOfLabel    }


}

