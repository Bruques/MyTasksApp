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
}
