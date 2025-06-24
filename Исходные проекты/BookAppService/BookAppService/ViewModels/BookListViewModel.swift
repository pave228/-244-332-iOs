import Foundation

@MainActor
class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: BookServiceProtocol

    init(service: BookServiceProtocol) {
        self.service = service
    }

    func loadBooks() async {
        isLoading = true
        errorMessage = nil

        do {
            books = try await service.fetchBooks()
        } catch {
            errorMessage = "Ошибка: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
