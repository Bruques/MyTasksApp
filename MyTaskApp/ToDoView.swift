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
                        if !viewModel.taskTitle.isEmpty {
                            self.viewModel.tasks.append(self.viewModel.taskTitle)
                            self.viewModel.isCompleted.append(false)
                            self.viewModel.taskTitle = ""
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
                    ForEach(self.viewModel.tasks.indices, id: \.self) { index in
                        HStack {
                            Image(systemName: self.viewModel.isCompleted[index] ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    self.viewModel.isCompleted[index].toggle()
                                }
                            Spacer()
                                .frame(width: 16)
                            Text(self.viewModel.tasks[index])
                        }
                    }
                    .onDelete(perform: self.deleteItem)
                }
                
                
                Spacer()
            }
            .navigationTitle("My tasks")
        }
    }
    func deleteItem(at offsets: IndexSet) {
        self.viewModel.tasks.remove(atOffsets: offsets)
        self.viewModel.isCompleted.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(viewModel: ToDoViewModel())
    }
}
