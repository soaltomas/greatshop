import Foundation
import Alamofire

struct ProductRequestRouter {
    
    /// Запрос на получение корзины пользователя
    ///
    /// - Parameter parameters: в качестве параметров принимает идентификатор пользователя - 'id_user'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func getBasket(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/getBasket.json", parameters: parameters)
    }
    
    /// Запрос на добавление товара в корзину
    ///
    /// - Parameter parameters: в качестве параметров принимает идентификатор товара - 'id_product' и его количество - 'quantity'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func addToBasket(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/addToBasket.json", parameters: parameters)
    }
    
    /// Запрос на удаление товара из корзины
    ///
    /// - Parameter parameters: в качестве параметра принимает идентификатор товара - 'id_product'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func deleteFromBasket(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/deleteFromBasket.json", parameters: parameters)
    }
    
    /// Запрос на получение списка товаров
    ///
    /// - Parameter parameters: в качестве параметра принимает номер страницы - 'page_number' и идентификатор категории товара - 'id_category'
    /// - Returns: возвращает структуру, содержащую метод, url и параметры запроса
    static func getProductList(parameters: Parameters) -> RequestConverter {
        return RequestConverter(method: .get, path: "/catalogData.json", parameters: parameters)
    }
}

