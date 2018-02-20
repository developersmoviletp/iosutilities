
import UIKit

public class SegmentedControlValidator: Validator {

    var mValidators : [Validator] = []
    var mSegmentedControl : UISegmentedControl!
    var mPositionValue : Int = 0
    
    public init(segmentedControl : UISegmentedControl, positionValue : Int, validators : Validator...){
        super.init()
        self.mSegmentedControl = segmentedControl
        mPositionValue = positionValue
        for validator in validators{
            self.mValidators.append(validator)
        }
    }
    
    override func isValid() -> Bool{
        var valid : Bool = true
        if mSegmentedControl.selectedSegmentIndex == mPositionValue {
            for validator in mValidators {
                if valid && !validator.isValid() {
                    valid = false
                }
            }
        }
        return valid
    }
    
    override func showError(valid : Bool){
        for validator in mValidators {
            validator.showError(valid: validator.isValid())
        }
    }
    
}
