/*
 
 NASIR MAHMOOD
 
 Comment:
 MODEL
 Made with Realm and Object MApper to automap objects to RealmDatabase.
 
 */

import Foundation
import RealmSwift
import ObjectMapper

class User: Object,Mappable  {
    
    var email = ""
    var latlng = ""
    var name = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
}

//MARK: Mapper Extension
extension User
{
    func mapping(map: Map) {
        email <- map["email"]
        latlng <- map["latlng"]
        name <- map["name"]
        
    }
}
