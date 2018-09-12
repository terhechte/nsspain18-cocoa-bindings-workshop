import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var arrayController: NSArrayController!

    override init() {
        super.init()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }
}

