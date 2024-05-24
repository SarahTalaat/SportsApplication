//
//  LeaguesViewModelProtocol.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation


protocol LeaguesViewModelProtocol {
    var leaguesArray: [League]? {get}
  //  func fetchLeagues(completionHandler: @escaping () -> Void)
    func getLeagues(sport: String)
    var resultToViewController: (() -> Void) { get set }
    
}
