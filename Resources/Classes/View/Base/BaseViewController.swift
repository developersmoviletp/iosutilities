
import UIKit

open class BaseViewController: UIViewController, UITextFieldDelegate {

    public var mPresenter : BasePresenter?
    public var mPresenters : [BasePresenter]! = []
    public var extras : [String: AnyObject] = [:]
    public var resultDelegate : ControllerResultDelegate?
    public var requestValue : String = ""
    public var resultValue : ViewControllerResult = ViewControllerResult.RESULT_ERROR
    public var data : [String : AnyObject] = [:]
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        mPresenter = getPresenter()
        mPresenters = getPresenters()
        if mPresenter != nil {
            mPresenter?.viewDidLoad()
        }
        for presenter in mPresenters! {
            presenter.viewDidLoad()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        if mPresenter != nil {
            mPresenter?.viewDidAppear()
        }
        for presenter in mPresenters! {
            presenter.viewDidAppear()
        }
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        if resultDelegate != nil {
            resultDelegate?.viewControllerForResult(keyRequest: requestValue, result: resultValue, data: data)
        }
        if mPresenter != nil {
            mPresenter?.viewDidDisappear()
        }
        for presenter in mPresenters! {
            presenter.viewDidDisappear()
        }
    }
    
    open func getPresenter() -> BasePresenter? {
        return nil
    }
    
    open func getPresenters() -> [BasePresenter]? {
        return []
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if mPresenter != nil {
            mPresenter?.viewWillAppear()
        }
        for presenter in mPresenters! {
            presenter.viewWillAppear()
        }
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if mPresenter != nil {
            mPresenter?.viewWillDisappear()
        }
        for presenter in mPresenters! {
            presenter.viewWillDisappear()
        }
    }
    
    public func onViewControllerResult() {
        
    }
    
    public func onViewControllerResult(params: [String : String]?) {
        
    }
    
    public func hasExtra(key: APIKeys) -> Bool{
        return self.extras[key] != nil
    }
    
    @objc public  func hideKeyboard() {
        view.endEditing(true)
    }
    
    public func resignFirstResponser(textFields : UITextField...){
        for textField in textFields{
            textField.resignFirstResponder()
        }
    }
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

