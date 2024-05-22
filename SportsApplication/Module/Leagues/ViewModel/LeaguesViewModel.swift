//
//  LeaguesViewModel.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation


class LeaguesViewModel: LeaguesViewModelProtocol {

    
    var leaguesArray: [League] = []
    var networkService: NetworkProtocol
    
    init(networkService: NetworkProtocol){
        self.networkService = networkService
    }
    
    func fetchLeagues(completionHandler: @escaping () -> Void) {
        networkService.fetchLeagues { [weak self] (data) in
            
            guard let data = data else {
                completionHandler()
                return
            }
            
            self?.leaguesArray = data.result ?? []
            completionHandler()
        }
    }
    
    
    
}
