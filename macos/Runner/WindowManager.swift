//
//  MacOSWindowPlugin.swift
//  Runner
//
//  Created by Никита Михайлов on 25.11.2023.
//

import Foundation
import FlutterMacOS

public class MacOsPlatformPlugin: NSObject {
    
    private let flutterViewController: FlutterViewController
    
    init(flutterViewController: FlutterViewController) {
        self.flutterViewController = flutterViewController
        super.init()
        handle()
        
    }
    
    
    func handle() {
        let channel = FlutterMethodChannel(name: "MacOSPlatformPlugin", binaryMessenger:  flutterViewController.engine.binaryMessenger)
        
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "getOSInfo":
                let platformVersion = self.getOSInfo()
                result(platformVersion)
                
            case "setWindowSize":
                result(self.setWindowSize(args: call.arguments))
                
            case "setWindowMinSize":
                result(self.setWindowMinSize(args: call.arguments))
                
            default:
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    private func getOSInfo() -> String {
        return ProcessInfo.processInfo.operatingSystemVersionString
    }
    
    private func setWindowSize(args: Any?) -> Bool {
        if let parameters = args as? [String: Any],
           let width = parameters["width"] as? Float,
           let height = parameters["height"] as? Float,
           let animate = parameters["animate"] as? Bool,
           let window = NSApplication.shared.mainWindow
        {
            var rect = window.frame
            rect.origin.y += (rect.size.height - CGFloat(height))
            rect.size.width = CGFloat(width)
            rect.size.height = CGFloat(height)
            
            window.animator().setFrame(rect, display: true, animate: animate)
            
            return true
        } else {
            return false
        }
    }
    
    private func setWindowMinSize(args: Any?) -> Bool {
        if let width: Float = (args as? [String: Any])?["width"] as? Float,
           let height: Float = (args as? [String: Any])?["height"] as? Float,
           let window = NSApplication.shared.mainWindow
        {
            window.minSize = CGSize(width: CGFloat(width), height: CGFloat(height))
            return true
        } else {
            return false
        }
        
    }
    
}
