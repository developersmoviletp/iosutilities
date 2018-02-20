

import UIKit

open class BaseDataSource<T: NSObject, C :BaseTableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, BaseTableDelegate {
    
    public var items : [T] = []
    public var itemSelected : T?
    public var tableView : UITableView?
    public var identifier : String?
    public var executeAction : Bool = false
    public var delegate : TableViewCellClickDelegate?
    
    public init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.delegate = nil
        settings()
    }
    
    public init(tableView: UITableView, delegate : TableViewCellClickDelegate) {
        super.init()
        self.tableView = tableView
        self.delegate = delegate
        settings()
    }
    
    public func settings(){
        self.identifier = "\(self.genericName())"
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.estimatedRowHeight = 10.0
        self.tableView?.rowHeight = UITableViewAutomaticDimension
    }
  
    public func update(items: [T]) {
        self.items = items
        self.tableView?.reloadData()
        self.executeAction = false
    }
    
    public func setHeightContent(){
        self.tableView?.isScrollEnabled = false
        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateHeight), userInfo: nil, repeats: false)
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.updateHeight), userInfo: nil, repeats: false)
    }
    
    @objc public func updateHeight() {
        for constraint in (tableView?.constraints)! {
            if (constraint.firstAttribute == NSLayoutAttribute.height && constraint.secondAttribute == NSLayoutAttribute.notAnAttribute) {
                constraint.constant = (tableView?.contentSize.height)!
            }
        }
        self.tableView?.superview?.layoutIfNeeded()
    }

    public func update(items: [T], action : Bool) {
        self.items = items
        self.tableView?.reloadData()
        self.executeAction = action
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        var cell : BaseTableViewCell? = getItemTypeCell(item : item)
        if cell == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: identifier!) as? BaseTableViewCell
        }
        
        cell?.pupulate(object: item)
        if item == itemSelected {
            cell?.pupulateSelected(object: item)
        }
        cell?.selectionStyle = .none

        if executeAction {
            cell?.executeAction()
        }
        
        cell?.delegateCell = self
        if delegate != nil{
            cell?.delegate = delegate
        }
        
        return cell!
    }
    
    open func getItemTypeCell(item : NSObject) -> BaseTableViewCell? {
        return nil
    }
    
    public func getCell<C: BaseTableViewCell>(cell : C.Type) -> BaseTableViewCell {
        let identifier = genericNameClass(cell : cell)
        return (tableView!.dequeueReusableCell(withIdentifier: identifier) as? BaseTableViewCell)!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    public func baseTableDelegate(sender: UITapGestureRecognizer){
        if sender.state == UIGestureRecognizerState.ended {
            let tapLocation = sender.location(in: self.tableView)
            if let tapIndexPath = self.tableView?.indexPathForRow(at: tapLocation) {
                if (self.tableView?.cellForRow(at: tapIndexPath) as? BaseTableViewCell) != nil {
                    let item = items[tapIndexPath.row]
                    itemSelected = item
                    tableView?.deselectRow(at: tapIndexPath, animated: true)
                    let cell : UITableViewCell = tableView!.cellForRow(at: tapIndexPath)!
                    self.delegate?.onTableViewCellClick(item: item, cell: cell)
                }
            }
        }
    }
    
    func genericName() -> String {
        let fullName: String = NSStringFromClass(C.self)
        let range = fullName.range(of: ".", options: .backwards, range: nil, locale: nil)
        if let range = range {
            return fullName.substring(from: range.upperBound)
        } else {
            return fullName
        }
    }
    
    func genericNameClass<C: BaseTableViewCell>(cell : C.Type) -> String {
        let fullName: String = NSStringFromClass(cell.self)
        let range = fullName.range(of: ".", options: .backwards, range: nil, locale: nil)
        if let range = range {
            return fullName.substring(from: range.upperBound)
        } else {
            return fullName
        }
    }
    
    
    
}

