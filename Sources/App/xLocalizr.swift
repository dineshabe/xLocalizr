//
//  File.swift
//  xLocalizr
//
//  Created by Dinesh Thangasamy on 2025-06-09.
//

import Cocoa

@main
@MainActor
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        let alert = NSAlert()
        alert.messageText = "✅ Hello from macOS App"
        alert.runModal()
        NSApp.terminate(nil)
    }
    
    
    static func main() {
        let app = NSApplication.shared
        let delegate = AppDelegate()
        app.delegate = delegate
        app.run()
    }
}
