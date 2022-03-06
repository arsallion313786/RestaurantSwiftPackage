import XCTest
@testable import RestaurantSwiftPackage

final class RestaurantSwiftPackageTests: XCTestCase {
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RestaurantSwiftPackage().text, "Hello, World!")
    }
    
    
    func testRestaurantListCount() async throws {
        
        let repo = RestaurantRepo();
        let result = try await repo.getRestaurants()
        
        XCTAssertTrue(result.count > 0, "Something went wrong")
    }
}
