//
//  ContentView.swift
//  MyTaskApp
//
//  Created by Bruno Marques on 20/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var taskTitle: String = ""
    @State var tasks: [String] = []
            
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Task title", text: $taskTitle)
                        .padding(.horizontal)
                    Button {
                        self.tasks.append(self.taskTitle)
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
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                }
                
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("My tasks")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
