

import UIKit

open class CheckBoxButton: UIButton {
    
    @IBInspectable dynamic var value : String = ""
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(handleTap(_:)), for: UIControlEvents.touchUpInside)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        isChecked = !isChecked
    }
    
    @objc public dynamic var isChecked:Bool = false{
        didSet{
            if isChecked {
                self.setImage(UIImage(named: "ic_checked"), for: UIControlState())
                //self.setImage(selectedImage, forState: UIControlState.Normal)
            }else{
                self.setImage(UIImage(), for: UIControlState())
                //self.setImage(unselectedImage, forState: UIControlState.Normal)
            }
            
        }
    }

}
