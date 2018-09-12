import Cocoa

@objc public final class CCApplication: NSApplication {
    @objc func _crashOnException(_ exception: NSException) {
        print("exception: \(exception)")
    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    override init() {
        // Convert empty selections into true, non-empty into false
        ValueTransformer.setValueTransformer(HideEmptySelectionValueTransformer(), forName: NSValueTransformerName(rawValue: "IsEmptySelection"))
        
        /// Convert true / false into color values
        ValueTransformer.setValueTransformer(ValueToColorTransformer(colors: [false: .black, true: .lightGray]), forName: NSValueTransformerName(rawValue: "falseLightGrayColor"))
        super.init()
    }
}

