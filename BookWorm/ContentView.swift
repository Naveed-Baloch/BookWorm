//
//  ContentView.swift
//  BookWorm
//
//  Created by Naveed on 26/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(students) { student in
                    Text(student.name)
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(students[index])
                    }
                })
            }
            .toolbar {
                Button("Insert Student") {
                    let student = Student(id: UUID(), name: "Naveed")
                    modelContext.insert(student)
                }
            }
            .navigationTitle("Classroom")
        }
    }
}

#Preview {
    ContentView()
}
