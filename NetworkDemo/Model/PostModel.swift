//
//  Model.swift
//  NetworkDemo
//
//  Created by Admin on 19.12.2019.
//  Copyright © 2019 sergei. All rights reserved.
//

import Foundation

struct PostModel: Decodable {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
