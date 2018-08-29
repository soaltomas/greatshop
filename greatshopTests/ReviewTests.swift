import XCTest
import Alamofire
import OHHTTPStubs
@testable import greatshop

class ReviewTests: XCTestCase {
    
    var reviewRequestFactory: ReviewRequestFactory!
    
    override func setUp() {
        super.setUp()
        reviewRequestFactory = ReviewRequestFactory(sessionManager: SessionManagerFactory.sessionManager,
                                                errorParser: ErrorParser(),
                                                queue: DispatchQueue.main)
    }
    
    override func tearDown() {
        super.tearDown()
        reviewRequestFactory = nil
    }
    
    func testAddReview() {
        let obj = MessageResponse.response
        stub(condition: isMethodGET() && pathEndsWith("/addReview.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: MessageResponse?
        let _ = reviewRequestFactory.addReview(userId: "123", text: "Текст отзыва", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
    
    func testApproveReview() {
        let obj = Response.response
        stub(condition: isMethodGET() && pathEndsWith("/approveReview.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: Response?
        let _ = reviewRequestFactory.approveReview(commentId: "123", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
    
    func testRemoveReview() {
        let obj = Response.response
        stub(condition: isMethodGET() && pathEndsWith("/removeReview.json")) { _ in
            return OHHTTPStubsResponse(jsonObject: obj.toDictionary(), statusCode: 200, headers: nil)
        }
        let expectation = self.expectation(description: "success")
        var responseObject: Response?
        let _ = reviewRequestFactory.approveReview(commentId: "123", completionHandler: { response in
            responseObject = response.value
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(responseObject?.toString(), obj.toString())
    }
}




