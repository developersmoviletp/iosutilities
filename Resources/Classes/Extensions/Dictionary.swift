

import UIKit

extension Dictionary {
    
    public subscript(key: APIKeys) -> Value? {
        get {
            return self[String(describing: key) as! Key]
        }
        set(value) {
            guard
                let value = value else {
                    self.removeValue(forKey: String(describing: key) as! Key)
                    return
            }
            
            self.updateValue(value, forKey: String(describing: key) as! Key)
        }
    }
}


public protocol APIKeys {}
