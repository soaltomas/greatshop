import Foundation
import Alamofire

struct AuthRequestRouter {

    /// Запрос на авторизацию пользователя
    ///
    /// - Parameter parameters: в качестве параметров передаётся 'login' и 'password'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func login(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/login.json", parameters: parameters)
    }
    /// Запрос на выход пользователя из системы
    ///
    /// - Parameter parameters: в качестве параметров передаётся идентификатор пользователя - 'id_user'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func logout(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/logout.json", parameters: parameters)
    }
    /// Запрос на регистрацию пользователя
    ///
    /// - Parameter parameters: в качестве параметров принимает:
    ///                                                         'id_user' - идентификатор пользователя
    ///                                                         'username' - логин
    ///                                                         'password' - пароль
    ///                                                         'email' - адрес эл. почты
    ///                                                         'gender' - пол
    ///                                                         'credit_card' - номер банковской карты
    ///                                                         'bio' - дополнительная информация о пользователе
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func registration(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/registerUser.json", parameters: parameters)
    }
    /// Запрос на изменение данных пользователя
    ///
    /// - Parameter parameters: в качестве параметров принимает:
    ///                                                         'id_user' - идентификатор пользователя
    ///                                                         'username' - логин
    ///                                                         'password' - пароль
    ///                                                         'email' - адрес эл. почты
    ///                                                         'gender' - пол
    ///                                                         'credit_card' - номер банковской карты
    ///                                                         'bio' - дополнительная информация о пользователе
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func changeProfile(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/changeUserData.json", parameters: parameters)
    }
}

