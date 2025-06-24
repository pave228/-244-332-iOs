import Foundation

@MainActor
class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadBooks() async {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://gutendex.com/books") else {
            errorMessage = "Неверный URL"
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(BookResponse.self, from: data)
            books = decoded.results
        } catch {
            errorMessage = "Ошибка загрузки: \(error.localizedDescription)"
        }

        isLoading = false
    }
}

struct BookResponse: Decodable {
    let results: [Book]
}
