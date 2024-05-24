//
//  DBManagerProtocol.swift
//  SportsApplication
//
//  Created by Sara Talat on 24/05/2024.
//

import Foundation
import CoreData

protocol DBManagerProtocol{
    func insert(favleague: LeagueLocal)
    func retriveLeaguesFromCoreData() -> [NSManagedObject]
    func deleteLeagueFromCoreData(favLeague: LeagueLocal) -> [NSManagedObject]
}
