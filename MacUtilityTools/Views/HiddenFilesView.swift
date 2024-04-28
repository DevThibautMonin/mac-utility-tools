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
        ToolItem(
            offImage: "eye.slash",
            onImage: "eye.fill",
            description: "Hidden files",
            isOn: toolState.hiddenFilesVisibility
        ) {
            toolState.hiddenFilesVisibility.toggle()
            commandViewmodel.executeCommand(command: "defaults write com.apple.finder AppleShowAllFiles \(toolState.hiddenFilesVisibility); killall Finder")
        }
        .padding(10)
    }
}
