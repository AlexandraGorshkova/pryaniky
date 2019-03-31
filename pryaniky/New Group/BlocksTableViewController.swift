//
//  BlocksTableViewController.swift
//  pryaniky
//
//  Created by Alexandra Gorshkova on 03/03/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit
import SDWebImage


class BlocksTableViewController: UITableViewController {

    let blockService = Services()
    var block = BlockClass()
    let dateFormatter = DateFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        blockService.loadBlock { block in
            self.block = block
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segue1":
            let destinationVC = segue.destination as! ViewController
            let leb = block.data[HZ_TYPE] as! HzDataItem
            destinationVC.textOfLabel = leb.text
        case "segue2":
            let destinationVC = segue.destination as! ViewController2
            let leb = block.data[PICTURE_TYPE] as! PictureDataItem
            destinationVC.textOfLabel = leb.text
        case "segue3":
            let destinationVC = segue.destination as! ViewController3
            let leb = block.data[SELECTOR_TYPE] as! SelectorDataItem
            destinationVC.textOfLabel = String(leb.selectedId)
        default:
            return
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return block.views.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        switch block.views[indexPath.row] {
        case HZ_TYPE:
          let hzCell = tableView.dequeueReusableCell(withIdentifier: HZ_TYPE, for: indexPath) as! BlockCell
          let data = (block.data[HZ_TYPE] as! HzDataItem)
          hzCell.hzText.text = data.text
          cell = hzCell
       
        case PICTURE_TYPE:
            let pictureCell = tableView.dequeueReusableCell(withIdentifier: PICTURE_TYPE, for: indexPath) as! PictureCell
            let data = (block.data[PICTURE_TYPE] as! PictureDataItem)
            pictureCell.pictureText.text = data.text
            pictureCell.urlImage.sd_setImage(with: URL(string: data.url))
            cell = pictureCell
        
        case SELECTOR_TYPE:
            let selectorCell = tableView.dequeueReusableCell(withIdentifier: SELECTOR_TYPE, for: indexPath) as! SelectorCell
          let data = (block.data[SELECTOR_TYPE] as! SelectorDataItem)
            var idFalse = [false,false,false]
            for i in 0...2 {
                if data.selectedId == i {
                idFalse[i] = true
                }
            }

            selectorCell.selectorText.text = data.variant[0]
            selectorCell.selectorText2.text = data.variant[1]
            selectorCell.selectorText3.text =  data.variant[2]
           

            selectorCell.chek.isOn = idFalse[0]
            selectorCell.chek2.isOn = idFalse[1]
            selectorCell.chek3.isOn = idFalse[2]
            cell = selectorCell
            
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: HZ_TYPE, for: indexPath) as! BlockCell
        }
        return cell
    }
    

   
}
