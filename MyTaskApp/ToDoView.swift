//
//  ContentView.swift
//  MyTaskApp
//
//  Created by Bruno Marques on 20/08/23.
//

import SwiftUI

struct ToDoView: View {
    @StateObject var viewModel: ToDoViewModel
    
            
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Task title", text: $viewModel.taskTitle)
                        .padding(.horizontal)
                    Button {
                        if !self.viewModel.taskTitle.isEmpty {
                            self.viewModel.addTask()
                        }
                    } label: {
                        Text("ADD")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(
                                Color.indigo.cornerRadius(50)
                            )
                    }
                }
                .frame(height: 50)
                .background(
                    Color.secondary.cornerRadius(50)
                )
                .padding(.horizontal)
                .padding(.top)
                
                List {
                    ForEach(self.viewModel.savedTasks.indices, id: \.self) { index in
                        HStack {
                            Image(systemName: self.viewModel.savedTasks[index].isCompleted ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    //Todo -> Find the way to fix this
//                                    self.viewModel.isCompleted[index].toggle()
                                }
                            Spacer()
                                .frame(width: 16)
                            Text(self.viewModel.savedTasks[index].title ?? "No value")
                        }
                    }
//                    .onDelete(perform: )
                }
                
                
                Spacer()
            }
            .navigationTitle("My tasks")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(viewModel: ToDoViewModel())
    }
}
