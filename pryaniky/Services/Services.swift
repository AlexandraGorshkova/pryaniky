//
//  Services.swift
//  pryaniky
//
//  Created by Alexandra Gorshkova on 03/03/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Services {
    let baseUrl = "https://prnk.blob.core.windows.net"
    
    func loadBlock( completion: @escaping (BlockClass) -> Void ){
        let path = "/tmp/JSONSample.json"
        let url = baseUrl + path
        
        Alamofire.request(url, method: .get, parameters: nil).responseData { repsons in
            guard let data = repsons.value else { return }
            let json = JSON(data)
            let dataBlock = BlockClass(json: json)
            completion(dataBlock)
        }
    }
}
