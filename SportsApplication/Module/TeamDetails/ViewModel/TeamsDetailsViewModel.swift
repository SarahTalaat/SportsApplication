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
        let parameters: [String:Any] = ["met" : "Teams", "teamId" : teamId, "APIkey": Constants.API_KEY]
        Network().fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<TeamDetails>?) in

            self?.teamDetailsArray = response?.result ?? []
            print("ViewModel TeamArrayCount: \(self?.teamDetailsArray?.count ?? 55555)")
            print("ViewModel Data: \(self?.teamDetailsArray?[0].result?[0].team_name ?? "tttt" )")
      }
    }

//https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=5&APIkey=15217216adc4a8d0eb9fc199593c980ada1693e793d69f681e94a7685b0359b4

}


