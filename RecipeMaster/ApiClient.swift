//
//  ApiClient.swift
//  RecipeMaster
//
//  Created by Arkadiusz Żmudzin on 21.10.2016.
//  Copyright © 2016 Arkadiusz Żmudzin. All rights reserved.
//

import SwiftyJSON
import Alamofire

class ApiClient {
    
    static func getRecipe(completionHandler: @escaping (Recipe) -> Void) {
        Alamofire.request("http://mooduplabs.com/test/info.php").responseJSON { response in
            
            switch response.result {
            case .success(let value):
                completionHandler(Recipe(JSON: JSON(value).dictionaryObject!)!)
            case .failure(let error):
                print(error)
            }
        }

    }
}
