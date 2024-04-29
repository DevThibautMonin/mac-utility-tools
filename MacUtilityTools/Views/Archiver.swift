//
//  Archiver.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 29/04/2024.
//

import SwiftUI

struct Archiver: View {
    @ObservedObject var toolState : ToolState
    var commandViewmodel = CommandViewmodel()
    
    var body: some View {
        ToolItem(
            offImage: "doc.zipper",
            onImage: "doc.zipper",
            description: "Archiver",
            isOn: toolState.hiddenFilesVisibility
        ) {
            print("Zipped")
        }
        .padding(10)
    }
}
