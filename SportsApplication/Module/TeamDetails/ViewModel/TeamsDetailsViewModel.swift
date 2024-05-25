//
//  TeamsViewModel.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation

class TeamsDetailsViewModel: TeamsDetailsViewModelProtocol{
    
    var resultToViewController: (() -> Void) = {}
    var teamDetailsArray: [TeamDetails]? = []
    {
        didSet{
          resultToViewController()
        }
    }
    
    func getTeamDetails(sport: String, teamId: Int) {
        let url = "https://apiv2.allsportsapi.com/\(sport)/"
        let parameters = ["met" : "Teams","teamId" : "\(teamId)", "APIkey" : Constants.API_KEY]
        Network().fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<TeamDetails>?) in
            self?.teamDetailsArray = response?.result ?? []
      }
        
        
    }

}

