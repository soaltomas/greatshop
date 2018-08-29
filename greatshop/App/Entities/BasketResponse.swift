import Foundation

struct BasketResponse: Codable {
    var amount: Int
    var count: Int
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case amount
        case count = "countGoods"
        case products = "contents"
    }
}
