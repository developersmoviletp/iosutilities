

import UIKit

public protocol TableViewCellClickDelegate: NSObjectProtocol {
    func onTableViewCellClick(item: NSObject, cell : UITableViewCell)
}
