//
//  TopscorersViewModel.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 01/06/2024.
//

import Foundation

class TopscorersViewModel{

    var resultToViewController: (()->()) = {}

    
    var player: [Player]?  = []{
        didSet{
            resultToViewController()
        }
    }


  func getTopScorersDetails(sportName: String, leagueId: String){
    
    let url = "https://apiv2.allsportsapi.com/\(sportName)/"
    let parameters = ["met" : "Topscorers", "leagueId" : leagueId, "APIkey" : Constants.API_KEY]

      Network().fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<Player>?) in
          self?.player = response?.result
    }
  }
}

