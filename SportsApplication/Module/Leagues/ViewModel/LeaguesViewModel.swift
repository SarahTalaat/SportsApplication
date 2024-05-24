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
    

    var networkService: NetworkProtocol
    
    init(networkService: NetworkProtocol){
        self.networkService = networkService
    }
    
    func getLeagues(sport: String) {
        let url = "https://apiv2.allsportsapi.com/\(sport)/"
        let parameters = ["met" : "Leagues", "APIkey" : Constants.API_KEY]
          networkService.fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<League>?) in
              self?.leaguesArray = response?.result ?? []
        }
    }
    
    

//    func fetchLeagues(completionHandler: @escaping () -> Void) {
//        Network().fetchLeagues { [weak self] (data) in
//
//            guard let data = data else {
//                completionHandler()
//                return
//            }
//
//            self?.leaguesArray = data.result ?? []
//            print("My array count is : \(self?.leaguesArray.count)")
//            completionHandler()
//        }
//    }
    
    
    
    
}
