

import UIKit
import ObjectMapper
import RealmSwift

public class BaseRealmRequest: Object, Mappable {

    required convenience public init?(map: Map) {
        self.init()
    }

    convenience init(user: String, password: String){
        self.init()
    }
    
    public func mapping(map: Map) {
        
    }
    
    
}
