import Foundation

/// Ответ на запрос авторизации
struct LoginResponse: Codable {
    /// Код ответа
    var result: Int
    /// Данные пользователя
    var user: User
}
