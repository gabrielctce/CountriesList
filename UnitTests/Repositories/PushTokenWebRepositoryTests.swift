import XCTest
import Combine
@testable import CountriesList

class PushTokenWebRepositoryTests: XCTestCase {

    private var sut: RealPushTokenWebRepository!
    private var cancelBag = CancelBag()
    
    override func setUp() {
        sut = RealPushTokenWebRepository(session: .mockedResponsesOnly,
                                         baseURL: "https://test.com")
    }
    
    override func tearDown() {
        cancelBag = CancelBag()
    }
    
    func test_register() {
        let exp = XCTestExpectation(description: #function)
        sut.register(devicePushToken: Data())
            .sinkToResult { result in
                result.assertSuccess()
                exp.fulfill()
            }
            .store(in: cancelBag)
        wait(for: [exp], timeout: 0.1)
    }
}
