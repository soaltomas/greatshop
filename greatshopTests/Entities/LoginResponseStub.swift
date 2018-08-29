import Foundation
@testable import greatshop

extension LoginResponse {
    static var response: LoginResponse {
        return LoginResponse(result: 1, user: User(id: 123, login: "geekbrains", password: "mypassword", firstName: "John", lastName: "Doe", email: "", gender: "", creditCard: "", biography: ""))
    }
    
    func toDictionary() -> [String : Any] {
        return ["result" : self.result,
                "user" :
                    ["id_user" : self.user.id,
                     "user_login" : self.user.login,
                     "user_name" : self.user.firstName,
                     "user_lastname" : self.user.lastName]]
    }
    
    func toString() -> String {
        do {
            let data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8)!
        } catch {
            return ""
        }
    }
}
