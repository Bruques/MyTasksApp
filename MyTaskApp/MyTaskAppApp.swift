//
//  MyTaskAppApp.swift
//  MyTaskApp
//
//  Created by Bruno Marques on 20/08/23.
//

import SwiftUI

@main
struct MyTaskAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
