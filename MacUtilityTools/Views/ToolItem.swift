//
//  ToolItem.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 28/04/2024.
//

import SwiftUI

struct ToolItem: View {
    var offImage: String
    var onImage: String
    var description: String
    var isOn: Bool
    var action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: isOn ? onImage : offImage)
            Text(description)
                .font(.caption)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
        }
        .frame(width: 70, height: 40)
        .padding()
        .background(isOn ? Color("ToolItemToggled") : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .onTapGesture {
            action()
        }
        .onHover(perform: { hovering in
            if hovering {
                NSCursor.pointingHand.set()
            } else {
                NSCursor.arrow.set()
            }
        })
    }
}

#Preview {
    VStack {
        ToolItem(offImage: "eye.fill", onImage: "eye.slash", description: "Clipboard history", isOn: true) {
            
        }
    }
}
