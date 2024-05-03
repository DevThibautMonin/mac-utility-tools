//
//  ScreenToText.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 02/05/2024.
//

import SwiftUI
import Vision

struct ScreenToText: View {
    @ObservedObject var toolState : ToolState
    var commandViewmodel = CommandViewmodel()
    @State var recognizedText = ""
    
    var body: some View {
        VStack {
//            Image(nsImage: image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            ToolItem(
                offImage: "photo.artframe",
                onImage: "photo.artframe",
                description: "Screen to text",
                isOn: toolState.hiddenFilesVisibility
            ) {
                ocr()
            }
            .padding(10)
            // TextEditor(text: $recognizedText).frame(width: 300, height: 300)
        }
    }
    
    func ocr() {
        let image = NSImage(named: "Quote")

        if let cgImage = image?.cgImage(forProposedRect: nil, context: nil, hints: nil) {

            let handler = VNImageRequestHandler(cgImage: cgImage)

            let recognizeRequest = VNRecognizeTextRequest { (request, error) in

                guard let result = request.results as? [VNRecognizedTextObservation] else {
                    return
                }

                let stringArray = result.compactMap { result in
                    result.topCandidates(1).first?.string
                }
                
                DispatchQueue.main.async {
                    recognizedText = stringArray.joined(separator: "\n")
                }
            }

            recognizeRequest.recognitionLevel = .accurate
            do {
                try handler.perform([recognizeRequest])
            } catch {
                print(error)
            }
        }
    }
}
