import Foundation
import Alamofire

class ReviewRequestFactory: AbstractRequestFactory {
    
    /// Добавление отзыва
    ///
    /// - Parameters:
    ///   - userId: идентификатор пользователя
    ///   - text: текст отзыва
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func addReview(userId: String,
                   text: String,
                   completionHandler: @escaping (DataResponse<MessageResponse>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_user" : userId,
                                      "text" : text]
        return self.sessionManager.request(ReviewRequestRouter.addReview(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                            completionHandler: completionHandler)
    }
    
    /// Одобрение отзыва
    ///
    /// - Parameters:
    ///   - commentId: идентификатор отзыва
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func approveReview(commentId: String, completionHandler: @escaping (DataResponse<Response>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_comment" : commentId]
        return self.sessionManager.request(ReviewRequestRouter.approveReview(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                                completionHandler: completionHandler)
    }
    
    /// Удаление отзыва
    ///
    /// - Parameters:
    ///   - commentId: идентификатор отзыва
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func removeReview(commentId: String, completionHandler: @escaping (DataResponse<Response>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_comment" : commentId]
        return self.sessionManager.request(ReviewRequestRouter.removeReview(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                               completionHandler: completionHandler)
    }
}
