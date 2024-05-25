//
//  TeamsViewModel.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation
import Alamofire


class TeamsDetailsViewModel: TeamsDetailsViewModelProtocol{
    
    var resultToViewController: (() -> Void) = {}
    var teamDetailsArray: [TeamDetails]? = []
    {
        didSet{
          resultToViewController()
        }
    }

    func getTeamDetails(sport: String, teamId: String) {
        let url = "https://apiv2.allsportsapi.com/\(sport)/"
        let urlParameters: Parameters = ["met" : "Teams", "teamId" : teamId, "APIkey": Constants.API_KEY]

        Network().fetchDataFromAPI(url: url, param: urlParameters){ [weak self] (response : MyResponse<TeamDetails>?) in

            self?.teamDetailsArray = response?.result ?? []
            print("XXX ViewModel TeamArrayCount: \(self?.teamDetailsArray?.count ?? 55555)")
            print("XXX Players count: \(self?.teamDetailsArray?[0].result?[0].players?.count ?? 4444444 )")
            print("XXX ViewModel Data: \(self?.teamDetailsArray?[0].result?[0].team_name ?? "NO TEAM NAME!!!!" )")
      }
    }
    




}


//https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=5&APIkey=15217216adc4a8d0eb9fc199593c980ada1693e793d69f681e94a7685b0359b4




