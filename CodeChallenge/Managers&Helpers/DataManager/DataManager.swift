import Foundation
import RealmSwift
import Alamofire
import ObjectMapper

class DataManager {
    
    static let sharedInstance = DataManager()
    
    //MARK: Instance Methods
    func requestData(_ completion: @escaping (_ results: [Reciepe]?, _ error: DataError?) -> Void) {
        
        DataManager.sharedInstance.readAndLoadFile("recipes", fileExtension: "json")
        
        if let realm = RealmProvider.realm(){
            let foodies = (realm.objects(Reciepe.self).toArray())
            
            OperationQueue.main.addOperation({
                completion(foodies,nil)
                
            })
        }
        else{
            completion(nil, nil)
        }
        
    }
    
    //MARK: class Methods
    private func readAndLoadFile(_ resource: String, fileExtension: String) {
        
        if let realm = RealmProvider.realm(){
        
            guard realm.objects(Reciepe.self).toArray().count == 0 else {
                return
            }
            
            guard let json = jsonFromSourceFile(resource: resource, fileExtension: fileExtension) else {
                return
            }
            
            let reciepies = Mapper<Reciepe>().mapArray(JSONArray: json)
            try! realm.write {
                for rxp in reciepies{
                    realm.add(rxp)
                }
            }
            
        }
    }
    
    private func jsonFromSourceFile(resource: String, fileExtension: String) -> [[String: Any]]? {
        guard let file = Bundle.main.url(forResource: resource, withExtension: fileExtension) else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
            return json
        }catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    
}
