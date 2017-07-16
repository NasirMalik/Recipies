/*
 
 NASIR MAHMOOD
 
 Comment:
 Work in combination with  Network manager and Response to handle types of data
 Network
 
 */
import Foundation
import Alamofire
import AlamofireObjectMapper


protocol Command {
    func execute()
}

class FetchCommand : Command {
    var completionHandler: ([Reciepe]) -> Void
    var netManager : NetworkManager?
    
    required init(completionHandler: @escaping ([Reciepe])->Void) {
        self.completionHandler = completionHandler
    }
    
    public func execute() {
        NetworkManager.sharedInstance.request(APIEndpoints.BaseUrl, method: .get, parameters: nil).responseArray { (response: DataResponse<[Reciepe]>) in
            if let reciepeResponse = response.result.value, reciepeResponse.count > 0 {
                self.completionHandler(reciepeResponse)
            }
        }

    }
}
