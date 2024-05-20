//
//  NetworkServiceProtocol.swift
//  SportsTrial
//
//  Created by Sara Talat on 18/05/2024.
//

import Foundation


protocol APIServiceProtocol {
    
    func fetchLeagues(completionHandler: @escaping  (LeagueResult?) -> Void)
    
}
