

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

let CUSTOM_HEADERS = [
    "Content-Type": "application/json",
    "Authorization" : "Basic ZmZtYXBwOjRnZW5kNG1pM250bw==",
    "Accept" : "application/json"
]

open class BaseRetrofitManager<Res : BaseResponse>: NSObject {
    
    var requestUrl : String
    var delegate : AlamofireResponseDelegate
    var request : Alamofire.Request?
    
    public init(requestUrl: String, delegate : AlamofireResponseDelegate){
        self.delegate = delegate
        self.requestUrl = requestUrl
    }
    
    open func getJsonDebug(requestUrl : String) -> String {
        return ""
    }
    
    open func getDebugEnabled() -> Bool {
        return false
    }
    
    var Manager: Alamofire.SessionManager = {
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "https://189.203.181.233": .disableEvaluation,
            "189.203.181.233": .disableEvaluation
        ]
        
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return manager
    }()
    
    public func request(requestModel : BaseRequest) {
        if getDebugEnabled() {
            let json : String = getJsonDebug(requestUrl : self.requestUrl)
            if json != ""{
                let response = Res(JSONString: json)
                self.delegate.onSuccessLoadResponse(requestUrl : self.requestUrl, response: response!)
            }
            return
        }
        if ConnectionUtils.isConnectedToNetwork(){
            delegate.onRequestWs()
            
            let params  = Mapper().toJSON(requestModel)
            
            request = Manager.request(self.requestUrl, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: CUSTOM_HEADERS).responseObject {
                (response: DataResponse<Res>) in
                switch response.result {
                case .success:
                    self.delegate.onSuccessLoadResponse(requestUrl : self.requestUrl, response: response.result.value! as Res)
                case .failure(_):
                    self.delegate.onErrorLoadResponse(requestUrl : self.requestUrl, messageError : "")
                }
            }
        } else {
            delegate.onErrorConnection()
        }
    }
    
    public func requestRealm(requestModel : BaseRealmRequest) {
        if getDebugEnabled() {
            let json : String = getJsonDebug(requestUrl : self.requestUrl)
            if json != ""{
                let response = Res(JSONString: json)
                self.delegate.onSuccessLoadResponse(requestUrl : self.requestUrl, response: response!)
            }
            return
        }
        if ConnectionUtils.isConnectedToNetwork(){
            delegate.onRequestWs()
            
            let params  = Mapper().toJSON(requestModel)
            print(params)
            request = Manager.request(self.requestUrl, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: CUSTOM_HEADERS).responseObject {
                (response: DataResponse<Res>) in
                switch response.result {
                case .success:
                    self.delegate.onSuccessLoadResponse(requestUrl : self.requestUrl, response: response.result.value! as Res)
                case .failure(_):
                    self.delegate.onErrorLoadResponse(requestUrl : self.requestUrl, messageError : "")
                }
            }
            
            print("REQUEST = \(request)")
        } else {
            delegate.onErrorConnection()
        }
    }

}


public protocol AlamofireResponseDelegate {
    
    func onRequestWs()
    
    func onSuccessLoadResponse(requestUrl : String, response : BaseResponse)
    
    func onErrorLoadResponse(requestUrl : String, messageError : String)
    
    func onErrorConnection()
    
}
