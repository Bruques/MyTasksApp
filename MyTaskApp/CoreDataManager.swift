//
//  CoreDataManager.swift
//  MyTaskApp
//
//  Created by Bruno Marques on 20/08/23.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        self.persistentContainer = NSPersistentContainer(name: "MyTaskApp")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading. \(error)")
            }
        }
    }
}
