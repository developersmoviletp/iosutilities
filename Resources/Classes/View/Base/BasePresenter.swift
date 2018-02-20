

import UIKit

open class BasePresenter: NSObject {
    
    public var mViewController : BaseViewController
    
    public init(viewController : BaseViewController){
        self.mViewController = viewController
    }
    
    open func viewDidLoad(){
    }
    
    open func viewWillAppear(){
    }
    
    open func viewDidAppear(){
    }
    
    open func viewWillDisappear(){
    }
    
    open func viewDidDisappear(){
    }
    
    open func viewDidUnload(){
    }
    
}

