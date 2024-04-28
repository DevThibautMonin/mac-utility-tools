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
        HStack {
            HiddenFilesView(toolState: toolState)
            PresentationMode(toolState: toolState)
        }
    }
}
