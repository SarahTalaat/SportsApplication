//
//  NetworkProtocol.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 20/05/2024.
//

import Foundation


protocol NetworkProtocol {
    
    func fetchLeagues(completionHandler: @escaping  (LeagueResult?) -> Void)
    

import Alamofire

protocol NetworkProtocol {
    func fetchDataFromAPI<T: Decodable>(url: String, param: Parameters, completionHandler: @escaping (MyResponse<T>?) -> Void)

}
