

import UIKit

open class BaseNavigationViewController: UINavigationController {
    
    var resultDelegate : ControllerResultDelegate?
    var requestValue : String = ""
    var extras : [String: AnyObject] = [:]
    var resultValue : ViewControllerResult = ViewControllerResult.RESULT_ERROR
    var data : [String : AnyObject] = [:]
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        if resultDelegate != nil {
            resultDelegate?.viewControllerForResult(keyRequest: requestValue, result: resultValue, data: data)
        }
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func onViewControllerResult() {
        
    }
    
    func onViewControllerResult(params: [String : String]?) {
        
    }
    
    
}
