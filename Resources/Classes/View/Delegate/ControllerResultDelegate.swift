

import UIKit

public enum ViewControllerResult{
    case RESULT_OK
    case RESULT_ERROR
}

public protocol ControllerResultDelegate: NSObjectProtocol {

    func viewControllerForResult(keyRequest : String, result : ViewControllerResult, data : [String : AnyObject])
    
}
