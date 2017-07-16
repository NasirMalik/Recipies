/*
 
 NASIR MAHMOOD
 
 Comment:
 Shared Network Manager  
 Network layer to work on top of Alamofire
 
 */

import Foundation
import Alamofire

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    var email = "" // to be passed while creating 
    var password = "" // to be passed while creating 
    
    var alamoManager : SessionManager!
    init() {
        let configuration = URLSessionConfiguration.default
        var headers : [AnyHashable : Any] = Alamofire.SessionManager.defaultHTTPHeaders
        headers.updateValue("application/json, application/x-www-form-urlencoded, */*", forKey: "Accept")
        headers.updateValue("application/json", forKey: "Content-Type")
        configuration.httpAdditionalHeaders = headers
        alamoManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    // There is no such requirement for API calls, this method is just to show basic authentication needed for login, and way to handle response for recipie fetch calls, FetchCommand -> execute
    open func request(_ url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> DataRequest
    {
        if let credentialData = "\(email):\(password)".data(using: String.Encoding.utf8) {
            let base64Credentials = credentialData.base64EncodedString()
            let authheaders = ["Authorization": "Basic \(base64Credentials)"]
            return alamoManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: authheaders)
        }
        else{
            return alamoManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        }
        
    }
    
    
    
}
