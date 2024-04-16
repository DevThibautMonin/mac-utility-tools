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
    var commandViewmodel = CommandViewmodel()
    
    var body: some View {
    
    Toggle(
        "Hidden files",
        systemImage: toolState.hiddenFilesVisibility ? "eye.fill" : "eye.slash",
        isOn: $toolState.hiddenFilesVisibility
    )
    .padding(10)
    .toggleStyle(.switch)
        .onChange(of: toolState.hiddenFilesVisibility) {
            commandViewmodel.executeCommand(command: "defaults write com.apple.finder AppleShowAllFiles \(toolState.hiddenFilesVisibility); killall Finder")
        }
    }
}
