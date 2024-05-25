//
//  TeamsViewModelProtocol.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation

protocol TeamsDetailsViewModelProtocol {

    var teamDetailsArray: [TeamDetails]? {get}
    func getTeamDetails(sport: String, teamId: String)
    var resultToViewController: (() -> Void) { get set }
    
}
