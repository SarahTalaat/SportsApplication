//
//  LeagueDetailsViewModel.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import Foundation

class LeagueDetailsViewModel{

      var resultToViewController: (()->()) = {}
    var resultDBToViewController: (()->()) = {}
      let database = DBManager.favouriteLeagueDB
      var leagues: [LeagueLocal] = []


      var upcomingEvent: [Event]? = []
      {
        didSet{
          resultToViewController()
        }
      }

      var latestEvent: [Event]? = []
      {
        didSet{
          resultToViewController()
        }
      }

        var teams: [Team]? = []
      {
        didSet{
          resultToViewController()
        }
      }
    
    var isFavourite: Bool = false {
      didSet{
          resultDBToViewController()
      }
    }
    
    
    func insertFavouriteLeague(league: LeagueLocal){
      database.insert(favleague: league)
      isFavourite = true
    }
    
    func isFavourite(leagueId: Int){
      leagues =  database.getAllLeaguesQuery() ?? []
      var isExist = false
      for item in leagues{
          if item.key == leagueId{
          isExist = true
          break
        }
      }
        isFavourite = isExist
    }


   func getUpcomingEvent(sportName: String, leagueId: String, startDate: String, endDate: String){
       
    let url = "https://apiv2.allsportsapi.com/\(sportName)/"
    let parameters = ["met" : "Fixtures", "leagueId" : leagueId, "from" : startDate, "to" : endDate, "APIkey" : Constants.API_KEY]
      Network().fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<Event>?) in
          self?.upcomingEvent = response?.result
    }
  }

    
    func getLatestEvent(sportName: String, leagueId: String, startDate: String, endDate: String){

     let url = "https://apiv2.allsportsapi.com/\(sportName)/"
     let parameters = ["met" : "Fixtures", "leagueId" : leagueId, "from" : startDate, "to" : endDate, "APIkey" : Constants.API_KEY]
       Network().fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<Event>?) in
           self?.latestEvent = response?.result
     }
   }

   func getTeams(sportName: String, leagueId: String){

    let url = "https://apiv2.allsportsapi.com/\(sportName)/"
    let parameters = ["met" : "Teams", "leagueId" : leagueId, "APIkey" : Constants.API_KEY]

      Network().fetchDataFromAPI(url: url, param: parameters){ [weak self] (response : MyResponse<Team>?) in
          self?.teams = response?.result
    }
  }




}
