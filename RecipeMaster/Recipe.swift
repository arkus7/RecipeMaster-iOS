//
//  Recipe.swift
//  RecipeMaster
//
//  Created by Arkadiusz Żmudzin on 21.10.2016.
//  Copyright © 2016 Arkadiusz Żmudzin. All rights reserved.
//

import ObjectMapper

class Recipe : Mappable {
    
    var title: String?
    var description: String?
    var ingredients: [String]
    var preparations: [String]
    var images: [String]
    
    required init?(map: Map) {
        ingredients = [String]()
        preparations = [String]()
        images = [String]()
        
    }
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.description <- map["description"]
        self.ingredients <- map["ingredients"]
        self.preparations <- map["preparing"]
        self.images <- map["imgs"]
    }
}
