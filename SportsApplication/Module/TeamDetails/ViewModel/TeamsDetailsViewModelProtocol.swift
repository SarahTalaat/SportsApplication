//
//  TeamsViewModelProtocol.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation

protocol TeamsDetailsViewModelProtocol {

    var teamDetailsArray: [Result]? {get}
    func getTeamDetails(sport: String, teamId: String)
    var resultToViewController: (() -> Void) { get set }
    
}
