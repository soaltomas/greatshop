import Foundation

struct ProductListResponse: Codable {
    var pageNumber: Int
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products
    }
}
