//
//  PostModel.swift
//  Airlift-Test
//
//  Created by Sikander Zeb on 12/09/2021.
//

import Foundation
import ObjectMapper
class PostModel: Mappable, Identifiable {
    
    var id: Int = 0
    var largeImageURL: String = ""
    var previewURL: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        largeImageURL <- map["largeImageURL"]
        previewURL <- map["previewURL"]
    }
    
    
}

