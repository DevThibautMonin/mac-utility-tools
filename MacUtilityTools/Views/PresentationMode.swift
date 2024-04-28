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
            ToolItem(
                offImage: "video.fill.badge.checkmark",
                onImage: "video.badge.checkmark",
                description: "Presentation",
                isOn: toolState.presentationMode
            ) {
                toolState.presentationMode.toggle()
                commandViewmodel.executeCommand(command: "defaults write com.apple.finder CreateDesktop \(!toolState.presentationMode); killall Finder")
            }
            .padding(10)
    }
}
