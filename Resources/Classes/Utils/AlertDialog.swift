

import UIKit
import PKHUD

open class AlertDialog {
    
    static var overlay : UIView?
    static var viewController : UIViewController?
    
    public static func show(title: String, body: String, view : UIViewController, handler: ((UIAlertAction) -> Swift.Void)? = nil){
        let refreshAlert = UIAlertController(title: title, message: body, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        view.present(refreshAlert, animated: true, completion: nil)
    }
    
    @objc static func pressed(){
        
    }
    
    public static func showOverlay(){
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    public static func hideOverlay(){
        PKHUD.sharedHUD.hide(true)
    }
    
}
