//
//  BlockClass.swift
//  pryaniky
//
//  Created by Alexandra Gorshkova on 04/03/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import Foundation
import SwiftyJSON

let HZ_TYPE = "hz"
let PICTURE_TYPE = "picture"
let SELECTOR_TYPE = "selector"

class BlockClass {
    
    var data = [String: BaseDataItem]()
    var views = [String]()
    
    init() {}
    
    init(json: JSON) {
        let viewsRaw = json.dictionary?["view"]?.arrayValue
        let dataRaw = json.dictionary?["data"]?.arrayValue
        viewsRaw?.forEach({ (viewRaw) in
            views.append(viewRaw.stringValue)
        })
        dataRaw?.forEach({ (dataItemRaw) in
            let dict = dataItemRaw.dictionary
            guard let item = dict?["name"] else { return }
            switch (item.stringValue) {
            case HZ_TYPE: do {
                let text = dict?["data"]?.dictionary?["text"]
                data[HZ_TYPE] = HzDataItem(text: text?.stringValue ?? "")
            }
            case PICTURE_TYPE: do {
                let text = dict?["data"]?.dictionary?["text"]
                let url = dict?["data"]?.dictionary?["url"]
                data[PICTURE_TYPE] = PictureDataItem(
                    text: text?.stringValue ?? "", url: url?.stringValue ?? ""
                )
            }
            case SELECTOR_TYPE: do{
                guard let selectedId = dict?["data"]?.dictionary?["selectedId"]?.intValue else {return }
                var variantData = [String]()
                let variants = dict?["data"]?.dictionary?["variants"]?.arrayValue
                variants?.forEach({ (variantId) in
                    let diii = variantId.dictionary
                    guard let textt = diii?["text"]?.stringValue else {return }
                    variantData.append(textt)
                })
                
                data[SELECTOR_TYPE] = SelectorDataItem(selectedId: selectedId, variant: variantData)
                }
                
            default: do { }
            }
        })
    }
}


class BaseDataItem {}

class HzDataItem : BaseDataItem {
    
    var text: String = ""
    
    init(text: String) {
        self.text = text
    }
    
}

class PictureDataItem: BaseDataItem {
    var text: String = ""
    var url: String = ""
    
    init(text: String, url: String) {
        self.text = text
        self.url = url
    }
}

class SelectorDataItem : BaseDataItem {
    var selectedId: Int = 0
    var variant = [String]()

    init(selectedId: Int, variant : [String]){
        self.selectedId = selectedId
        self.variant = variant
    }
}

