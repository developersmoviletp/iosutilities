

import UIKit
import ObjectMapper

open class BaseResponse: NSObject, Mappable {
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    open func mapping(map: Map) {
    }

}
