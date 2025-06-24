import Foundation

struct Book: Identifiable, Decodable {
    let id: Int
    let title: String
    let authors: [Author]
    let languages: [String]
    let download_count: Int
    let subjects: [String]?
    let bookshelves: [String]?

    struct Author: Decodable {
        let name: String
    }
}

