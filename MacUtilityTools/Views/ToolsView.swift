//
//  ToolsView.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 11/04/2024.
//

import Foundation
import SwiftUI

struct ToolsView : View {
    @ObservedObject var toolState : ToolState
    
    var body: some View {
        let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        LazyVGrid(columns: columns) {
            HiddenFilesView(toolState: toolState)
            PresentationMode(toolState: toolState)
            ClipboardHistory(toolState: toolState)
            Archiver(toolState: toolState)
            Colorpicker(toolState: toolState)
        }
    }
}
