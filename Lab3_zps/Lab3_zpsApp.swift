//
//  Lab3_zpsApp.swift
//  Lab3_zps
//
//  Created by Jakub Zelmanowicz on 17/10/2023.
//

import SwiftUI

@main
struct Lab3_zpsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
