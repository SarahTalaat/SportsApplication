//
//  LeaguesViewModel.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation


class LeaguesViewModel: LeaguesViewModelProtocol {

    var resultToViewController: (()->()) = {}
    
    var leaguesArray: [League]? = []
    {
        didSet{
          resultToViewController()
        }
    }
    
    var networkProtocol: NetworkProtocol
    
    init(networkProtocol: NetworkProtocol){
        self.networkProtocol = networkProtocol
    }
    
    func getLeagues(sport: String) {
        let url = "https://apiv2.allsportsapi.com/\(sport)/"
        let parameters = ["met" : "Leagues", "APIkey" : Constants.API_KEY]
          networkProtocol.fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<League>?) in
              self?.leaguesArray = response?.result ?? []
              print("League name::  \(self?.leaguesArray?[0].league_name)")
        }
    }
    
    

    
    
    
    
}
