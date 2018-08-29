import Foundation
import Crashlytics

enum AnalyticEvent {
    enum LoginParams {
        static let defaultMethod = "auth"
    }
    
    case login(method: String, success: Bool)
    case search(query: String)
    case viewProduct(productName: String)
    case pay(price: Int, success: Bool)
    case addToBasket(price: Int, productName: String)
    case deleteFromBasket(price: Int, productName: String)
}

protocol TrackableMixin {
    func track(_ event: AnalyticEvent)
}

extension TrackableMixin {
    func track(_ event: AnalyticEvent) {
        switch event {
        case let .login(method, success):
            let success = NSNumber(value: success)
            Answers.logLogin(withMethod: method, success: success, customAttributes: nil)
        case let .search(query):
            Answers.logSearch(withQuery: query, customAttributes: nil)
        case let .viewProduct(productName):
            Answers.logCustomEvent(withName: "View product", customAttributes: [
                "Name" : productName
                ])
        case let .pay(price, success):
            let price = NSDecimalNumber(value: price)
            let success = NSNumber(value: success)
            Answers.logPurchase(
                withPrice: price,
                currency: "RUB",
                success: success,
                itemName: nil,
                itemType: nil,
                itemId: nil,
                customAttributes: nil)
        case let .addToBasket(price, productName):
            let price = NSDecimalNumber(value: price)
            Answers.logAddToCart(
                withPrice: price,
                currency: "RUB",
                itemName: productName,
                itemType: nil,
                itemId: nil,
                customAttributes: nil)
        case let .deleteFromBasket(price, productName):
            let price = NSDecimalNumber(value: price)
            Answers.logCustomEvent(withName: "Delete from basket", customAttributes: [
                "Price" : price,
                "Name" : productName
                ])
        }
    }
}
