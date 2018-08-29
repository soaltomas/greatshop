import Foundation
import Alamofire

class ProductRequestFactory: AbstractRequestFactory {
    
    /// Получение корзины пользователя
    ///
    /// - Parameters:
    ///   - userId: идентификатор пользователя
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func getBasket(userId: Int, completionHandler: @escaping (DataResponse<BasketResponse>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_user" : userId]
        return self.sessionManager.request(ProductRequestRouter
                                .getBasket(parameters: parameters))
                                .responseCodable(errorParser: errorParser, completionHandler: completionHandler)
    }
    
    /// Добавление товара в корзину
    ///
    /// - Parameters:
    ///   - productId: идентификатор товара
    ///   - quantity: кол-во данного товара
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func addToBasket(productId: String,
                     quantity: String,
                     completionHandler: @escaping (DataResponse<Response>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_product" : productId,
                                      "quantity" : quantity]
        return self.sessionManager.request(ProductRequestRouter.addToBasket(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                               completionHandler: completionHandler)
    }
    
    /// Удаление товара из корзины
    ///
    /// - Parameters:
    ///   - productId: идентификатор товара
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сформированный url
    @discardableResult
    func deleteFromBasket(productId: String, completionHandler: @escaping (DataResponse<Response>) -> Void) -> DataRequest {
        let parameters: Parameters = ["id_product" : productId]
        return self.sessionManager.request(ProductRequestRouter.deleteFromBasket(parameters: parameters)).responseCodable(errorParser: errorParser,
                                                                                                               completionHandler: completionHandler)
    }
    
    /// Получение списка товаров
    ///
    /// - Parameters:
    ///   - pageNumber: номер страницы
    ///   - categoryId: идентификатор категории товара
    ///   - completionHandler: обработчик ответа
    /// - Returns: возвращает сфрмированный url
    @discardableResult
    func getProductList(pageNumber: Int, categoryId: Int, completionHandler: @escaping (DataResponse<[Product]>) -> Void) -> DataRequest {
        let parameters: Parameters = ["page_number" : pageNumber,
                                      "id_category" : categoryId]
        return self.sessionManager.request(ProductRequestRouter.getProductList(parameters: parameters)).responseCodable(errorParser: errorParser, completionHandler: completionHandler)
    }
}
