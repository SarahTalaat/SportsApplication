//
//  Network.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 20/05/2024.
//


import Foundation
import Alamofire



class Network: NetworkProtocol {
    func fetchDataFromAPI<T>(url: String, param: Parameters, completionHandler: @escaping (MyResponse<T>?) -> Void) where T: Decodable {
        
        Alamofire.request(url, method: .get, parameters: param).responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let responseObj = try JSONDecoder().decode(MyResponse<T>.self, from: jsonData)
                    completionHandler(responseObj)
                } catch let error {
                    print("Decoding error: \(error)")
                    completionHandler(nil)
                }
            case .failure(let error):
                print("Request error: \(error.localizedDescription)")
                completionHandler(nil)
            }
        }
    }
}
