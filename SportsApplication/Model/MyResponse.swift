//
//  MyResponse.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import Foundation

struct MyResponse<T>: Decodable where T: Decodable{
  
  var success: Int?
  var result: [T]?
  
}
