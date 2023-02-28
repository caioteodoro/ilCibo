//
//  CibberApp.swift
//  Cibber
//
//  Created by Caio Teodoro on 08/12/22.
//

import SwiftUI

@main
struct CibberApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
