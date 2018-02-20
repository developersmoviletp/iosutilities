

extension String {
    public func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
