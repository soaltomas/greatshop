import Foundation
@testable import greatshop

extension MessageResponse {
    static var response: MessageResponse {
        return MessageResponse(result: 1, userMessage: "Ваш отзыв был передан на модерацию", errorMessage: "")
    }
    
    func toDictionary() -> [String : Any] {
        return ["result" : self.result, "userMessage" : self.userMessage, "errorMessage" : self.errorMessage]
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
