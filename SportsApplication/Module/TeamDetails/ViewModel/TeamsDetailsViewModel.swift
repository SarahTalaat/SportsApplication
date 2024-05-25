//
//  TeamsViewModel.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation
import Alamofire


class TeamsDetailsViewModel: TeamsDetailsViewModelProtocol{
    
    var resultToViewController: (()->()) = {}
    var teamDetailsArray: [Result]? = []
    {
        didSet{
          resultToViewController()
        }
    }

    func getTeamDetails(sport: String, teamId: String) {
        
        print("XXX ViewModel sportParameter: \(sport), teamID: \(teamId)")
        let url = "https://apiv2.allsportsapi.com/\(sport)/"
        let urlParameters: Parameters = ["met" : "Teams", "leagueId" : teamId, "APIkey": Constants.API_KEY]
        
        Network().fetchDataFromAPI(url: url, param: urlParameters) { [weak self] (response : MyResponse<Result>?) in

            self?.teamDetailsArray = response?.result ?? []
            print("XXX response success: \(response?.success ?? 66666 )")

            print("XXX ViewModel TeamArrayCount: \(self?.teamDetailsArray?.count ?? 55555)")
            print("XXX Players count: \(self?.teamDetailsArray?[0].players?.count ?? 4444444 )")
            print("XXX ViewModel teamName: \(self?.teamDetailsArray?[0].team_name ?? "NO TEAM NAME!!!!" )")
            print("XXX ViewModel teamKey: \(self?.teamDetailsArray?[0].team_key ?? 777777 )")
        }
        
//        Network().fetchDataFromAPI(url: url, param: urlParameters) { [weak self] (response: MyResponse<TeamDetails>?) in
//            guard let response = response else {
//                print("XXX No response received")
//                return
//            }
//
//            self?.teamDetailsArray = response.result
//            print("XXX teamDetailsArray count: \(self?.teamDetailsArray?.count)")
//            if let teamDetails = response.result?.first {
//                // Here you can access the team details
//                print("XXX Team Name: \(teamDetails.result?[0].team_name ?? "NO TEAM NAME!! ")")
//                if let coach = teamDetails.result?[0].coaches?[0] {
//                    print("XXX Coach Name: \(coach.coach_name ?? "Unknown")")
//                }
//                if let players = teamDetails.result?[0].players{
//                    for player in players {
//                        print("XXX Player Name: \(player.player_name ?? "Unknown")")
//                    }
//                }
//            } else {
//                print("XXX No team details received")
//            }
//        }

        


        
        
        
        
        
//        Network().fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<TeamDetails>?) in
//
//            self?.teamDetailsArray = response?.result ?? []
//            print("XXX ViewModel TeamArrayCount: \(self?.teamDetailsArray?.count ?? 55555)")
//            print("XXX Players count: \(self?.teamDetailsArray?[0].result?[0].players?.count ?? 4444444 )")
//            print("XXX ViewModel Data: \(self?.teamDetailsArray?[0].result?[0].team_name ?? "NO TEAM NAME!!!!" )")
//      }
    }

}


//https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=5&APIkey=15217216adc4a8d0eb9fc199593c980ada1693e793d69f681e94a7685b0359b4




