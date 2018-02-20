

import UIKit

public class DeviceUtils: NSObject {

    public class func devideID() -> String{
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
}
