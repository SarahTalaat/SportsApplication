//
//  LeaguesViewModelProtocol.swift
//  SportsTrial
//
//  Created by Sara Talat on 18/05/2024.
//

import Foundation


protocol LeaguesViewModelProtocol {
    var leaguesArray: [League] {get}
    func fetchLeagues(completionHandler: @escaping () -> Void)
    
}
