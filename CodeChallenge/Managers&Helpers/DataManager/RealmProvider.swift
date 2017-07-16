import Foundation
import RealmSwift


class RealmProvider {
    
    class func realm() -> Realm? {
        var realmVar : Realm?
        if let _ = NSClassFromString("XCTest") {
            Realm.Configuration.defaultConfiguration.inMemoryIdentifier = RealmInMemoryEnvironments.TEST
            do {
                realmVar = try Realm(configuration: Realm.Configuration.defaultConfiguration)
            } catch  {
                realmVar = nil
            }
            
        }
        else {
            do {
                realmVar = try Realm()
            } catch  {
                realmVar = nil
             }
        }
        
        return realmVar
    }
    
}

