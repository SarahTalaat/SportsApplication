//
//  FavouritesViewModel.swift
//  SportsApplication
//
//  Created by Sara Talat on 24/05/2024.
//

import Foundation
import CoreData

class FavouritesViewModel: FavouritesViewModelProtocol{

    var favouriteLeaguesArray: [LeagueLocal] = []
    var favouriteLeagueNSManagedObjectArray: [NSManagedObject] = []
    var dbManager: DBManagerProtocol
    
    init(dbManager: DBManagerProtocol){
        self.dbManager = dbManager
    }
    
    func retriveLeaguesFromCoreData() -> [LeagueLocal] {
        
        favouriteLeagueNSManagedObjectArray = dbManager.retriveLeaguesFromCoreData()
        
        favouriteLeaguesArray.removeAll()
        
        favouriteLeaguesArray = convertManagedObjectsToLeagueLocals(nsManagedObjectArray: favouriteLeagueNSManagedObjectArray)
        
        return favouriteLeaguesArray
    }
    
    func deleteFromCoreData(favLeague: LeagueLocal) -> [LeagueLocal] {
        
        favouriteLeagueNSManagedObjectArray = dbManager.deleteFromCoreData(favLeague: favLeague)
        
        favouriteLeaguesArray.removeAll()
        
        favouriteLeaguesArray = convertManagedObjectsToLeagueLocals(nsManagedObjectArray: favouriteLeagueNSManagedObjectArray)
        
        return favouriteLeaguesArray
    }

    func convertManagedObjectsToLeagueLocals(nsManagedObjectArray: [NSManagedObject]) -> [LeagueLocal] {
        //compactMap -> works as map but it removes the nil values
        favouriteLeaguesArray = nsManagedObjectArray.compactMap { (managedObject) -> LeagueLocal? in
            guard let sport = managedObject.value(forKey: "sport") as? String,
                  let name = managedObject.value(forKey: "name") as? String,
                  let logo = managedObject.value(forKey: "logo") as? String,
                  let key = managedObject.value(forKey: "key") as? Int else {
                return nil
            }
            return LeagueLocal(sport: sport, name: name, logo: logo, key: key)
        }
        return favouriteLeaguesArray
    }
}

    




