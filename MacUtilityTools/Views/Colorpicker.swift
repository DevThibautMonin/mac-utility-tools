//
//  Colorpicker.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 29/04/2024.
//

import SwiftUI

struct Colorpicker: View {
    @ObservedObject var toolState : ToolState
    var commandViewmodel = CommandViewmodel()
    
    var body: some View {
        ToolItem(
            offImage: "pencil.circle",
            onImage: "pencil.circle",
            description: "Colorpicker",
            isOn: toolState.hiddenFilesVisibility
        ) {
            print("Colorpicker")
        }
        .padding(10)
    }
}
