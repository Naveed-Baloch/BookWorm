//
//  ContentView.swift
//  BookWorm
//
//  Created by Naveed on 26/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: removeBook)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar{
                if(!books.isEmpty) {
                    EditButton()
                }
                Button(action: {
                    showingAddScreen.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
                
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func removeBook(indexset: IndexSet) {
        for index in indexset {
            modelContext.delete(books[index])
        }
    }
}

#Preview {
    ContentView()
}
