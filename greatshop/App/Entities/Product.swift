import Foundation

struct Product: Codable {
    var id: Int
    var name: String
    var price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}
