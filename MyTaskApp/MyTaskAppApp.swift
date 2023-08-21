//
//  MyTaskAppApp.swift
//  MyTaskApp
//
//  Created by Bruno Marques on 20/08/23.
//

import SwiftUI

@main
struct MyTaskAppApp: App {
    
    let persistentContainer = CoreDataManager.shared.persistentContainer

    var body: some Scene {
        WindowGroup {
            ToDoView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
