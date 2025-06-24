import Foundation

protocol BookServiceProtocol {
    func fetchBooks() async throws -> [Book]
}

struct BookService: BookServiceProtocol {
    func fetchBooks() async throws -> [Book] {
        guard let url = URL(string: "https://gutendex.com/books") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(BookResponse.self, from: data)
        return response.results
    }
}
