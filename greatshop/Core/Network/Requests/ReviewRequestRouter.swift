import Foundation
import Alamofire

struct ReviewRequestRouter {
    
    /// Запрос на добавление отзыва
    ///
    /// - Parameter parameters: в качестве параметров принимает идентификатор пользователя - 'id_user' и текст отзыва - 'text'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func addReview(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/addReview.json", parameters: parameters)
    }
    
    /// Запрос на одобрение отзыва
    ///
    /// - Parameter parameters: в качестве параметра принимает идентификатор отзыва - 'id_comment'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func approveReview(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/approveReview.json", parameters: parameters)
    }
    
    /// Запрос на удаление отзыва
    ///
    /// - Parameter parameters: в качестве параметра принимает идентификатор отзыва - 'id_comment'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func removeReview(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/removeReview.json", parameters: parameters)
    }
}

