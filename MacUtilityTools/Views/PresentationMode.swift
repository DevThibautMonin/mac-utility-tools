//
//  DesktopIconsVisibility.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 16/04/2024.
//

import Foundation
import SwiftUI

struct PresentationMode : View {
    @ObservedObject var toolState : ToolState
    var commandViewmodel = CommandViewmodel()
    
    var body: some View {
    
    Toggle(
        "Presentation mode",
        systemImage: toolState.presentationMode ? "video.fill.badge.checkmark" : "video.badge.checkmark",
        isOn: $toolState.presentationMode
    )
    .padding(10)
    .toggleStyle(.switch)
        .onChange(of: toolState.presentationMode) {
            commandViewmodel.executeCommand(command: "defaults write com.apple.finder CreateDesktop \(!toolState.presentationMode); killall Finder")
        }
    }
    
}
