import Foundation
import Alamofire

class AuthRequestFactory: AbstractRequestFactory {
    
    /// Авторизация пользователя
    ///
    /// - Parameters:
    ///   - login: логин
    ///   - password: пароль
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func login(login: String, password: String, completionHandler: @escaping (DataResponse<LoginResponse>) -> Void) -> DataRequest {
        let credentials: Parameters = ["login" : login, "password" : password]
        return self.sessionManager.request(AuthRequestRouter.login(parameters: credentials)).responseCodable(errorParser: errorParser,
                                                                                                         completionHandler: completionHandler)
    }
    
    /// Выход из системы
    ///
    /// - Parameters:
    ///   - userId: идентификатор пользователя
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func logout(userId: String, completionHandler: @escaping (DataResponse<Response>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_user" : userId]
        return self.sessionManager.request(AuthRequestRouter.logout(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                         completionHandler: completionHandler)
    }
    
    /// Добавление нового либо обновление данных существующего пользователя
    ///
    /// - Parameters:
    ///   - userId: идентификатор пользователя
    ///   - login: логин
    ///   - password: пароль
    ///   - email: адрес эл. почты
    ///   - gender: пол
    ///   - creditCard: номер банковской карты
    ///   - biography: дополнительная информация о пользователе
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func addOrUpdateUser(userId: Int,
                       login: String,
                       password: String,
                       email: String,
                       gender: String,
                       creditCard: String,
                       biography: String,
                       completionHandler: @escaping (DataResponse<Response>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_user" : userId,
                                      "username" : login,
                                      "password" : password,
                                      "email" : email,
                                      "gender" : gender,
                                      "credit_card" : creditCard,
                                      "bio" : biography]
        if UserRepository.isExist(id: userId) {
            return self.sessionManager.request(AuthRequestRouter.changeProfile(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                                    completionHandler: completionHandler)
        } else {
            return self.sessionManager.request(AuthRequestRouter.registration(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                                   completionHandler: completionHandler)
        }
    }
}

