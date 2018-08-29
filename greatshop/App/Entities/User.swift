import Foundation

struct User: Codable {
    var id: Int
    var login: String
    var password: String = ""
    var firstName: String
    var lastName: String
    var email: String = ""
    var gender: String = ""
    var creditCard: String = ""
    var biography: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case firstName = "user_name"
        case lastName = "user_lastname"
    }
}
