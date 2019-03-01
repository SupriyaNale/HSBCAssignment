//
//  BookModel.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation
import ObjectMapper

class BookModel : Mappable {
    
    internal var id:String = "id"
    internal var title:String = "title"
    internal var author:String = "author"
    internal var imageUrl:String = "image"
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    init (id:String, title:String, auther:String, imageUrl:String) {
        self.id = "id"
        self.title = "title"
        self.author = "author"
        self.imageUrl = "image"
    }
    
    func mapping(map:Map) {
        id <- map[id]
        title <- map[title]
        author <- map[author]
        imageUrl <- map[imageUrl]
    }
}
