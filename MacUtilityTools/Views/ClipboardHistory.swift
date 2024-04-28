//
//  ClipboardHistory.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 28/04/2024.
//

import SwiftUI

struct ClipboardHistory: View {
    @ObservedObject var toolState : ToolState
    var commandViewmodel = CommandViewmodel()
    
    var body: some View {
            ToolItem(
                offImage: "list.bullet.clipboard",
                onImage: "eye.fill",
                description: "Clipboard history",
                isOn: toolState.hiddenFilesVisibility
            ) {
                print("Last text copied : Coucou")
            }
            .padding(10)
    }
}
