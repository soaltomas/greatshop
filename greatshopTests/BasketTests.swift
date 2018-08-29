import XCTest
import Alamofire
import OHHTTPStubs
@testable import greatshop

class BasketTests: XCTestCase {
    
    var productRequestFactory: ProductRequestFactory!
    
    override func setUp() {
        super.setUp()
        productRequestFactory = ProductRequestFactory(sessionManager: SessionManagerFactory.sessionManager,
                                                    errorParser: ErrorParser(),
                                                    queue: DispatchQueue.main)
    }
    
    override func tearDown() {
        super.tearDown()
        productRequestFactory = nil
    }
    
    func testAddToBasket() {
        let obj = Response.response
        stub(condition: isMethodGET() && pathEndsWith("/addToBasket.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: Response?
        let _ = productRequestFactory.addToBasket(productId: "123", quantity: "1", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
    
    func testDeleteFromBasket() {
        let obj = Response.response
        stub(condition: isMethodGET() && pathEndsWith("/deleteFromBasket.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: Response?
        let _ = productRequestFactory.deleteFromBasket(productId: "123", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
}




