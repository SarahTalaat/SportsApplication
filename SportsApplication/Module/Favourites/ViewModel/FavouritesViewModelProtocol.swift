//
//  FavouritesViewModelProtocol.swift
//  SportsApplication
//
//  Created by Sara Talat on 24/05/2024.
//

import Foundation
import CoreData

protocol FavouritesViewModelProtocol{
    var favouriteLeaguesArray: [LeagueLocal] {get}
    func retriveLeaguesFromCoreData() -> [LeagueLocal]
    func deleteLeagueFromCoreData(favLeague: LeagueLocal) -> [LeagueLocal]
    func convertManagedObjectsToLeagueLocals(nsManagedObjectArray: [NSManagedObject]) -> [LeagueLocal] 
}
