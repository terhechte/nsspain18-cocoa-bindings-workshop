import AppKit
import WebKit

final class ProfileViewController: NSViewController {
    
    @IBOutlet var profilesArrayController: NSArrayController?
    
    override func awakeFromNib() {
        profilesArrayController?.content = NSMutableArray(array: Model.users)
        profilesArrayController?.sortDescriptors = [
            NSSortDescriptor(key: "updated", ascending: true)
        ]
    }
}
