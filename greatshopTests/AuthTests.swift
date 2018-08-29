import XCTest
import Alamofire
import OHHTTPStubs
@testable import greatshop

class AuthTests: XCTestCase {
    
    var authRequestFactory: AuthRequestFactory!
    
    override func setUp() {
        super.setUp()
        authRequestFactory = AuthRequestFactory(sessionManager: SessionManagerFactory.sessionManager,
                                                errorParser: ErrorParser(),
                                                queue: DispatchQueue.main)
    }
    
    override func tearDown() {
        super.tearDown()
        authRequestFactory = nil
    }
    
    func testLogin() {
        let obj = LoginResponse.response
        stub(condition: isMethodGET() && pathEndsWith("/login.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: LoginResponse?
        let _ = authRequestFactory.login(login: "Somebody", password: "mypassword", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
    
    func testLogout() {
        let obj = Response.response
        stub(condition: isMethodGET() && pathEndsWith("/logout.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: Response?
        let _ = authRequestFactory.logout(userId: "123", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
    
    func testAddOrUpdate() {
        let obj = Response.response
        stub(condition: isMethodGET() && pathEndsWith("/changeUserData.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: Response?
        let _ = authRequestFactory.addOrUpdateUser(userId: 123, login: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", biography: "This is good! I think I will switch to another language", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
}



