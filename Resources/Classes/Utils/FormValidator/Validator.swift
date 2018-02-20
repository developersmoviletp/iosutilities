

import UIKit

public class Validator: NSObject {
    
    @objc dynamic var view : UIView!

    func isValid() -> Bool {
        preconditionFailure("This method must be overridden")
    }
    
    func showError(valid : Bool){
        preconditionFailure("This method must be overridden")
    }
    
}
