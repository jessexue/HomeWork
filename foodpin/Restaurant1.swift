//
//  Restaurant.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/14.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import Foundation

struct Restaurant1 {
    var name: String
    var type: String
    var location: String
    var image: String
    var isVisted: Bool
    var rating = ""
    
    
    init(name: String, type: String, location: String, image: String, isVisted: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisted = isVisted
    
    }
    
}


