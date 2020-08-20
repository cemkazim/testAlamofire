//
//  DataModel.swift
//  testAlamofire
//
//  Created by Cem Kazım on 20.08.2020.
//  Copyright © 2020 Cem Kazım. All rights reserved.
//

import Foundation

struct DataModel: Decodable {
    let name: String
    let site: String
    let object: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case site
        case object
    }
}
