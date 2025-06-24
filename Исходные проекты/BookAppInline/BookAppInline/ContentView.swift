import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BookListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Загрузка...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else if viewModel.books.isEmpty {
                    Text("Нет книг")
                } else {
                    List(viewModel.books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                if let author = book.authors.first {
                                    Text(author.name)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Книги")
        }
        .task {
            await viewModel.loadBooks()
        }
    }
}
