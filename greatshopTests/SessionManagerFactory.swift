import Foundation
import Alamofire
import OHHTTPStubs
@testable import greatshop

class SessionManagerFactory {
    
    static let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.httpShouldSetCookies = false
        configuration.urlCache = nil
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        OHHTTPStubs.setEnabled(true, for: configuration)
        return SessionManager(configuration: configuration)
    }()
}
