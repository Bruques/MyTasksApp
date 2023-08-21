//
//  ToDoViewModel.swift
//  MyTaskApp
//
//  Created by Bruno Marques on 20/08/23.
//

import Foundation
import CoreData

class ToDoViewModel: ObservableObject {
    @Published var taskTitle: String = ""
    @Published var tasks: [String] = ["Teste 1"]
    @Published var isCompleted: [Bool] = [false]
    @Published var savedTasks: [Task] = []
    
    init() {
        self.fetchTasks()
    }
    
    func fetchTasks() {
        let request = NSFetchRequest<Task>(entityName: "Task")
        do {
            self.savedTasks = try CoreDataManager.shared.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addTask() {
        let newtask = Task(context: CoreDataManager.shared.viewContext)
        newtask.title = taskTitle
        newtask.isCompleted = false
        self.taskTitle = ""
        self.saveData()
        self.fetchTasks()
    }
    
    func deleteTask(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let task = savedTasks[index]
        CoreDataManager.shared.viewContext.delete(task)
        self.saveData()
        self.fetchTasks()
    }
    
    func isCompletedToggle(index: Int) {
        self.savedTasks[index].isCompleted.toggle()
        self.saveData()
        self.fetchTasks()
    }
    
    func saveData() {
        do {
            try CoreDataManager.shared.viewContext.save()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
