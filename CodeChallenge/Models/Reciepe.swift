/*
 
 NASIR MAHMOOD
 
 Comment:
 MODEL OBJECT
 Made with Realm and Object MApper to automap objects to RealmDatabase.
 
 */

import Foundation
import RealmSwift
import ObjectMapper

fileprivate struct JSONConstants {
    
    static let kDeliverableIngredients = "deliverable_ingredients"
    static let kIngredients = "ingredients"
    static let kKeywords = "keywords"
    static let kProducts = "products"
    static let kUndeliverableIngredients = "undeliverable_ingredients"
    static let kWeeks = "weeks"
    static let kCalories = "calories"
    static let kCarbos = "carbos"
    static let kCountry = "country"
    static let kDescription = "description"
    static let kFats = "fats"
    static let kFibres = "fibers"
    static let kID = "id"
    static let kIncompatibles = "incompatibilities"
    static let kName = "name"
    static let kProteins = "proteins"
    static let kThumb = "thumb"
    static let kTime = "time"
    static let kImage = "image"
    static let kDifficulty = "difficulty"
    static let kFavourites = "favorites"
    static let kRatings = "rating"
    static let kRating = "ratings"
    static let kHighlighted = "highlighted"
    static let kUser = "user"
    
}


class RealmString: Object {
    dynamic var stringValue = ""
}

class Reciepe: Object, Mappable {
    
    var deliverable_ingredients = List<RealmString>()
    var ingredients = List<RealmString>()
    var keywords = List<RealmString>()
    var products = List<RealmString>()
    var undeliverable_ingredients = List<RealmString>()
    var weeks = List<RealmString>()

    dynamic var calories = ""
    dynamic var carbos =  ""
    dynamic var country =  ""
    dynamic var desc =  ""
    dynamic var fats =  ""
    dynamic var fibers =  ""
    dynamic var id =  ""
    dynamic var incompatibilities =  ""
    dynamic var name =  ""
    dynamic var proteins =  ""
    dynamic var thumb =  ""
    dynamic var time =  ""
    dynamic var image = ""
    
    let difficulty =  RealmOptional<Int>()
    let favorites  =  RealmOptional<Int>()
    let favorite   =  RealmOptional<Bool>()
    let rating     =  RealmOptional<Float>()
    let ratings    =  RealmOptional<Float>()
    
    let highlighted = RealmOptional<Bool>()
    dynamic var user: User?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
}

//MARK: Mapper EXtension
extension Reciepe
{
    func mapping(map: Map) {
        
        deliverable_ingredients <- map[JSONConstants.kDeliverableIngredients]
        ingredients  <- map[JSONConstants.kIngredients]
        keywords  <- map[JSONConstants.kKeywords]
        products  <- map[JSONConstants.kProducts]
        undeliverable_ingredients  <- map[JSONConstants.kDeliverableIngredients]
        weeks  <- map[JSONConstants.kWeeks]
        
        calories <- map[JSONConstants.kCalories]
        carbos <- map[JSONConstants.kCarbos]
        country <- map[JSONConstants.kCountry]
        desc <- map[JSONConstants.kDescription]
        fats <- map[JSONConstants.kFats]
        fibers <- map[JSONConstants.kFibres]
        id <- map[JSONConstants.kID]
        incompatibilities <- map[JSONConstants.kIncompatibles]
        name <- map[JSONConstants.kName]
        proteins <- map[JSONConstants.kProteins]
        thumb <- map[JSONConstants.kThumb]
        time <- map[JSONConstants.kTime]
        image <- map[JSONConstants.kImage]
        
        difficulty.value <- map[JSONConstants.kDifficulty]
        favorites.value <- map[JSONConstants.kFavourites]
        rating.value <- map[JSONConstants.kRating]
        ratings.value <- map[JSONConstants.kRatings]
        highlighted.value <- map[JSONConstants.kHighlighted]
        
        user =   User.init(map: map[JSONConstants.kUser])
    }

}

enum DataError: Error {
    case missing(String)
    case invalid(String, Any)
}
