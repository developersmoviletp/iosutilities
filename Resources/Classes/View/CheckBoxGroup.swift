

import UIKit

public protocol CheckGroupDelegate: NSObjectProtocol {
    
    func onCheckBoxButtonClick(checkButton : CheckBoxButton)
    
}


open class CheckBoxGroup: NSObject {
    
    public var delegate : CheckGroupDelegate?
    public var checksBox : [CheckBoxButton]!
    public var checkBoxSelected : CheckBoxButton?
    
    public init (checksBox : [CheckBoxButton], delegate : CheckGroupDelegate? = nil) {
        super.init()
        if delegate != nil {
            self.delegate = delegate
        }
        self.checksBox = checksBox
        for view in checksBox as [CheckBoxButton]{
            view.removeTarget(nil, action: nil, for: .allEvents)
            view.addTarget(self, action: #selector(handleTap(_:)), for: UIControlEvents.touchUpInside)
        }
    }
    
    @objc func handleTap(_ sender: CheckBoxButton? = nil) {
        self.checkBoxSelected = sender
        self.setCheck(checkBox: sender!)
        if delegate != nil{
                delegate?.onCheckBoxButtonClick(checkButton: sender!)
        }
    }
    
    public func setCheck(checkBox:CheckBoxButton){
        for view in checksBox as [CheckBoxButton]{
            if view != checkBox{
                view.isChecked = false
            }
        }
        checkBox.isChecked = true
    }
    
    public func getValue() -> String? {
        if checkBoxSelected != nil {
            return checkBoxSelected!.value
        }
        return ""
    }
    
    public func setValue(value : String){
        for view in checksBox as [CheckBoxButton]{
            if view.value == value {
                self.setCheck(checkBox: view)
            }
        }
    }

}
