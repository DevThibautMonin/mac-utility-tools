//
//  HiddenFilesView.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 11/04/2024.
//

import Foundation
import SwiftUI

struct HiddenFilesView : View {
    @ObservedObject var toolState : ToolState
    let homeDirURL = FileManager.default.homeDirectoryForCurrentUser
    
    var body: some View {
    
    Toggle(
        "Hidden files",
        systemImage: toolState.isToggle ? "eye.fill" : "eye.slash",
        isOn: $toolState.isToggle
    )
    .padding(10)
    .toggleStyle(.switch)
        .onChange(of: toolState.isToggle) {
            executeCommand(command: "defaults write com.apple.finder AppleShowAllFiles \(toolState.isToggle); killall Finder")
        }
    }
    
    private func executeCommand(command: String) {
        do {
            let task = Process()
            task.launchPath = "/bin/bash"
            task.currentDirectoryURL = homeDirURL
            task.arguments = ["-c", command]
            try task.run()
            task.waitUntilExit()
        } catch let error {
            print(error)
        }
    }
    
}
