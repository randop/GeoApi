import XCTest
@testable import GeoApi

class GeoApiTests: XCTestCase {
  let location1 = "Cardinal Rosales Ave, Cebu City, Cebu 6000, Philippines"
  let location2 = "Jose Maria del Mar St, Apas, Cebu City, Cebu 6000, Philippines"

  let client = GeoApi(apikey: "")

  func testGeocode() {
    let (latitude, longitude) = client.geocode(address: location1)
    XCTAssertEqual(latitude, 10.31752)
    XCTAssertEqual(longitude, 123.9073363)
  }

  func testMiles() {
    let distance = client.miles(from: location1, to: location2)
    #if swift(>=4.0)
    XCTAssertEqual(distance, 0.683275566924516, accuracy: 0.000000000000001)
    #else
    XCTAssertEqualWithAccuracy(distance, 0.683275566924516, accuracy: 0.000000000000001)
    #endif
  }

  static var allTests : [(String, (GeoApiTests) -> () throws -> Void)] {
    return [
      ("testGeocode", testGeocode),
      ("testMiles", testMiles)
    ]
  }
}
