//
//  CommandViewmodel.swift
//  MacUtilityTools
//
//  Created by Thibaut Monin on 16/04/2024.
//

import Foundation

class CommandViewmodel: ObservableObject {
    let homeDirURL = FileManager.default.homeDirectoryForCurrentUser
    
    func executeCommand(command: String) {
        do {
            let task = Process()
            task.launchPath = "/bin/bash"
            task.currentDirectoryURL = homeDirURL
            task.arguments = ["-c", command]
            try task.run()
            task.waitUntilExit()
        } catch let error {
            print(error)
        }
    }
}
