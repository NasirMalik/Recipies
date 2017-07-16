import Foundation
import ObjectMapper

final class ReciepeResponseList<Reciepe : Mappable> : Mappable {
    
    var result : [Reciepe]?
    
    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
    func mapping(map: Map) {
        result <- map["result"]
    }
    
}
