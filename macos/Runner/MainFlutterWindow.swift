import Cocoa
import FlutterMacOS
import IOKit.ps

class MainFlutterWindow: NSWindow {
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController()
        
        let windowFrame = self.frame
        self.contentViewController = flutterViewController
        self.setFrame(windowFrame, display: true)
        
        

        /// custom plugins for handle flutter events
        let macOsPlugin =  MacOsPlatformPlugin(flutterViewController: flutterViewController)
        
        RegisterGeneratedPlugins(registry: flutterViewController)
        
        
        super.awakeFromNib()
    }
}

