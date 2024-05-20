//
//  LeagueViewModel.swift
//  SportsTrial
//
//  Created by Sara Talat on 18/05/2024.
//

import Foundation


class LeaguesViewModel: LeaguesViewModelProtocol {

    
    var leaguesArray: [League] = []
    var apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol){
        self.apiService = apiService
    }
    
    func fetchLeagues(completionHandler: @escaping () -> Void) {
        apiService.fetchLeagues { [weak self] (data) in
            
            guard let data = data else {
                completionHandler()
                return
            }
            
            self?.leaguesArray = data.result ?? []
            completionHandler()
        }
    }
    
    
    
}
