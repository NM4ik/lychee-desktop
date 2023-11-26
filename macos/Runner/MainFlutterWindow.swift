import Cocoa
import FlutterMacOS
import IOKit.ps

class MainFlutterWindow: NSWindow {
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController()
        
        let windowFrame = self.frame
        self.contentViewController = flutterViewController
        self.setFrame(windowFrame, display: true)
        
        
        
        /// register custom classes/handlers with native code impl for flutter
//        let macOsPlugin: MacOsPlatformPlugin = .init(flutterViewController: flutterViewController)
        let macOsPlugin =  MacOsPlatformPlugin(flutterViewController: flutterViewController)
        
        RegisterGeneratedPlugins(registry: flutterViewController)
        
        
        super.awakeFromNib()
    }
}

