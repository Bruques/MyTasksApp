//
//  ContentView.swift
//  MyTaskApp
//
//  Created by Bruno Marques on 20/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var taskTitle: String = ""
    @State var tasks: [String] = ["Teste 1"]
    @State var isCompleted: [Bool] = [false]
            
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Task title", text: $taskTitle)
                        .padding(.horizontal)
                    Button {
                        self.tasks.append(self.taskTitle)
                        self.isCompleted.append(false)
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
                
                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack {
                            Image(systemName: self.isCompleted[index] ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    self.isCompleted[index].toggle()
                                }
                            Spacer()
                                .frame(width: 16)
                            Text(self.tasks[index])
                        }
                        
                    }
                    .onDelete(perform: self.deleteItem)
                }
                
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("My tasks")
        }
    }
    func deleteItem(at offsets: IndexSet) {
        self.tasks.remove(atOffsets: offsets)
        self.isCompleted.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
