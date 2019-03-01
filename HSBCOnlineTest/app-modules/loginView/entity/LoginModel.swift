//
//  LoginModel.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginModel : Mappable {
    
    internal var username:String = "username"
    internal var password:String = "password"
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    init (username:String, password:String) {
        self.username = username
        self.password = password
    }
    
    func mapping(map:Map){
        username <- map[username]
        password <- map[password]
    }
}
