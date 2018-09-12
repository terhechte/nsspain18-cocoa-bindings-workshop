import Foundation
import AppKit.NSColor

/// Returns bool true when a selection is empty, false otherwise
final class HideEmptySelectionValueTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return NSNumber.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let v = value as? NSIndexSet else { return nil }
        return NSNumber(booleanLiteral: v.count == 0)
    }    
}

/// Allows converting any hashable type to a NSColor
final class ValueToColorTransformer<T>: ValueTransformer where T: Hashable {

    private let colors: [T: NSColor]
    
    init(colors: [T: NSColor]) {
        self.colors = colors
    }
    
    override class func transformedValueClass() -> AnyClass {
        return NSColor.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let v = value as? T else { return nil }
        return colors[v]
    }
}
