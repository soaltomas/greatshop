import Foundation

/// Ответ, содержащий код и сообщение для пользователя(либо сообщение об ошибке)
struct MessageResponse: Codable {
    /// Код: 0 - ошибка, 1 - успех
    var result: Int
    /// Сообщение для пользователя
    var userMessage: String
    /// Сообщение об ошибке
    var errorMessage: String
}
