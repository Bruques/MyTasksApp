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
    let toDoViewModel = ToDoViewModel()
    var body: some Scene {
        WindowGroup {
            ToDoView(viewModel: toDoViewModel)
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
