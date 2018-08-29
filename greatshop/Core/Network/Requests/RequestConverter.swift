import Foundation
import Alamofire

struct RequestConverter: URLRequestConvertible {
    
    var method: HTTPMethod
    var path: String
    var parameters: Parameters = [:]
    
    init(method: HTTPMethod, path: String, parameters: Parameters = [:]) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let BASE_URL: String = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses"
        
        let url = try BASE_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
