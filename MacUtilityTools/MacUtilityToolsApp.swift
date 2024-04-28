//
//  MacUtilityToolsApp.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 10/04/2024.
//

import SwiftUI
import AppKit

@main
struct MacUtilityToolsApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var toolState = ToolState()
    
    var body: some Scene {
        MenuBarExtra("MacUtilityTools", image: "MacUtilityToolsIcon") {
            ToolsView(toolState: toolState)
        }.menuBarExtraStyle(.window)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { event in
            if event.modifierFlags.contains(.command) && event.keyCode == 12 {
                NSApp.terminate(self)
            }
        }
    }
}
