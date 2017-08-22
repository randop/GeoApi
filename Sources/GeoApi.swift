import Foundation
import Dispatch

class GeoApi {
  var apikey = ""
  
  
  /// Initialize class
  ///
  /// - Parameter apikey: Google GeoCoding API Key
  init(apikey: String) {
    self.apikey = apikey
  }
  
  
  /// Get Latitude and Longitude of given address
  ///
  /// - Parameter address: Address
  /// - Returns: Latitude, Longitude
  func geocode(address: String) -> (Double, Double) {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
    let urlComponents = NSURLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json")!
    urlComponents.queryItems = [
      URLQueryItem(name: "address", value: address),
      URLQueryItem(name: "key", value: self.apikey)
    ]
    var request = URLRequest(url: urlComponents.url!)
    request.httpMethod = "GET"
    let semaphore = DispatchSemaphore.init(value: 0)
    let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
      if (error == nil) {
        do {
          if let data = data,
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
            let results = json["results"] as? [[String: Any]] {
            if let geometry = results.first!["geometry"] as? [String: Any] {
              if let location = geometry["location"] as? [String: Any] {
                latitude = location["lat"] as! Double
                longitude = location["lng"] as! Double
              }
            }
          }
        } catch {
          //void
        }
      }
      
      semaphore.signal()
    })
    task.resume()
    semaphore.wait()
    
    return (latitude, longitude)
  }
  
  
  /// Calculate the distance
  ///
  /// - Parameters:
  ///   - from: Latitude, Longitude
  ///   - to: Latitude, Longitude
  /// - Returns: Distance in miles
  func distance(from: (latitude: Double, longitude: Double), to: (latitude: Double, longitude: Double) ) -> Double {
    if (from.latitude==0.0 && from.longitude==0.0) || (to.latitude==0.0 && to.longitude==0.0) {
      return 0.0
    }
    var miles = 0.0
    let theta = from.longitude - to.longitude
    var distance = sin(deg2rad(from.latitude)) * sin(deg2rad(to.latitude)) + cos(deg2rad(from.latitude)) * cos(deg2rad(to.latitude)) * cos(deg2rad(theta))
    distance = rad2deg(acos(distance))
    miles = distance * 60 * 1.1515
    return miles
  }
  
  func deg2rad(_ deg: Double) -> Double {
    return deg * Double.pi / 180.0
  }
  
  func rad2deg(_ rad: Double) -> Double {
    return rad * 180.0 / Double.pi
  }
  
  
  /// Get distance of two given addresses
  ///
  /// - Parameters:
  ///   - from: 1st address
  ///   - to: 2nd address
  /// - Returns: Distance in miles
  func miles(from: String, to: String) -> Double {
    let (fromLatitude, fromLongitude) = geocode(address: from)
    let (toLatitude, toLongitude) = geocode(address: to)
    return distance(from: (fromLatitude, fromLongitude), to: (toLatitude, toLongitude))
  }
}
