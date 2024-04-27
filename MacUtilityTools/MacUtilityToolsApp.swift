//
//  MacUtilityToolsApp.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 10/04/2024.
//

import SwiftUI

@main
struct MacUtilityToolsApp: App {
    @StateObject var toolState = ToolState()
    
    var body: some Scene {
        MenuBarExtra("MacUtilityTools", image: "MacUtilityToolsIcon") {
            ToolsView(toolState: toolState)
        }.menuBarExtraStyle(.window)
    }
}
