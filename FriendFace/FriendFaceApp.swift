//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Robert-Dumitru Oprea on 16/04/2023.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
