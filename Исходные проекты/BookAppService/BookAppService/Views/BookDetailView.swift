import SwiftUI

struct BookDetailView: View {
    let book: Book

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(book.title)
                    .font(.title)
                    .bold()

                if !book.authors.isEmpty {
                    Text("Авторы:")
                        .font(.headline)
                    ForEach(book.authors, id: \.name) { author in
                        Text(author.name)
                    }
                }

                Text("Языки: \(book.languages.joined(separator: ", "))")
                Text("Скачиваний: \(book.download_count)")

                if let subjects = book.subjects, !subjects.isEmpty {
                    Text("Темы:")
                        .font(.headline)
                    ForEach(subjects, id: \.self) { subject in
                        Text(subject)
                    }
                }

                if let shelves = book.bookshelves, !shelves.isEmpty {
                    Text("Категории:")
                        .font(.headline)
                    ForEach(shelves, id: \.self) { shelf in
                        Text(shelf)
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Детали")
    }
}
