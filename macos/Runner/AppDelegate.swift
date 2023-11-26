import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        
        
//        let controller = windowController.contentViewController as! FlutterViewController
//        CustomPlugin.register(with: controller)
        return true
    }
}
