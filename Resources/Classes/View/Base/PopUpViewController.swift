

import UIKit

open class PopUpViewController: BaseViewController, UIGestureRecognizerDelegate {
    
    var bottomLeftViewBottomConstraint : NSLayoutConstraint!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 180.0/256.0)
        view.isOpaque = false
        
        bottomLeftViewBottomConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal
            , toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([bottomLeftViewBottomConstraint])
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        //tap.delegate = self
        //self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        if (sender as NSNotification).userInfo != nil {
            
            let userInfo:NSDictionary = sender.userInfo! as NSDictionary
            let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            bottomLeftViewBottomConstraint.constant = -keyboardHeight
            
        }
    }
    
    
    @objc func keyboardWillHide(_ sender: Notification) {
        bottomLeftViewBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
