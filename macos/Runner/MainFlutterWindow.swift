import Cocoa
import FlutterMacOS
import IOKit.ps

class MainFlutterWindow: NSWindow {
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController()
        
        
        //        CustomPlugin.register(with: registry.registrar(forPlugin: "CustomPluginPlugin"))
        
        let windowFrame = self.frame
        self.contentViewController = flutterViewController
        self.setFrame(windowFrame, display: true)
        
        
        
        /// custom classes with native code impl for flutter
        let macOsPlugin: MacOsPlatformPlugin = .init(flutterViewController: flutterViewController)
        macOsPlugin.handle()
        
        
        RegisterGeneratedPlugins(registry: flutterViewController)
        
        
        super.awakeFromNib()
    }
}

private func getBatteryLevel() -> Int? {
    let info = IOPSCopyPowerSourcesInfo().takeRetainedValue()
    let sources: Array<CFTypeRef> = IOPSCopyPowerSourcesList(info).takeRetainedValue() as Array
    if let source = sources.first {
        let description =
        IOPSGetPowerSourceDescription(info, source).takeUnretainedValue() as! [String: AnyObject]
        if let level = description[kIOPSCurrentCapacityKey] as? Int {
            return level
        }
    }
    return nil
}
