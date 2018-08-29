import Foundation
@testable import greatshop

extension Response {
    static var response: Response {
        return Response(result: 1)
    }
    
    func toDictionary() -> [String : Any] {
        return ["result" : self.result]
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
