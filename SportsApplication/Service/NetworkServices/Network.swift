//
//  Network.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 20/05/2024.
//


import Foundation
import Alamofire


//class Network {
//    var mainUrl:String = "https://apiv2.allsportsapi.com/"
//    var sport: String?
//    var restOfUrl: String = "/?met=Leagues&APIkey=dcfe2db90576c23689ab51880e9ab6a7e3f3f8c57b3a5f83c5dee71fb20c618f"
//
//    
//    var fullUrl: String {
//        if let sport = sport {
//            print("1")
//            return mainUrl + sport + restOfUrl
//        } else {
//            print("2")
//            return mainUrl + "basketball" + restOfUrl
//        }
//    }
//    
//
//    
//    func fetchLeagues(completionHandler: @escaping (LeagueResult?) -> Void) {
//        Alamofire.request(fullUrl).response{ response in
//            debugPrint("Response: \(response)")
//            
//            guard let response = response.data else {
//                print("no data")
//                return
//            }
//            do{
//
//                let results = try JSONDecoder().decode(LeagueResult.self, from: response)
//                print("x")
//                print(results.success ?? 000)
//                completionHandler(results)
//                
//            }catch{
//                print(error.localizedDescription)
//            }
//            
//            
//        }
//    }
//    
//    
//    
//    
//}
//
///*
// "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=dcfe2db90576c23689ab51880e9ab6a7e3f3f8c57b3a5f83c5dee71fb20c618f"
// */



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



