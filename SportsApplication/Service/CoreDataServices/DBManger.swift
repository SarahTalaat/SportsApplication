//
//  DBManger.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 20/05/2024.
//

import Foundation
import CoreData
import UIKit

class DBManager: DBManagerProtocol{
    static let favouriteLeagueDB = DBManager()
    
    var arrayOfLeagues: Array<LeagueLocal>? = []
    var nsManagedLeagues : [NSManagedObject] = []
    let manager : NSManagedObjectContext!
    let favEntity: NSEntityDescription!
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        manager = appDelegate.persistentContainer.viewContext
        favEntity = NSEntityDescription.entity(forEntityName: "FavouriteEntity", in: manager)
    }
    
    func insert(favleague: LeagueLocal){
        let league = NSManagedObject(entity: favEntity!, insertInto: manager)
        league.setValue(favleague.name, forKey: "name")
        league.setValue(favleague.logo, forKey: "logo")
        league.setValue(favleague.key, forKey: "key")
        league.setValue(favleague.sport, forKey: "sport")
        
        do {
            try manager.save()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func retriveLeaguesFromCoreData() -> [NSManagedObject] {

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteEntity")
        
        do {
            let leagues = try manager.fetch(fetchRequest)
            return leagues
        } catch let error as NSError {
            print("Error retrieving data: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteFromCoreData(favLeague: LeagueLocal) -> [NSManagedObject] {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteEntity")
        let predicate = NSPredicate(format: "key == %@", favLeague.key)
        fetchRequest.predicate = predicate
        
        do {
            if let result = try manager.fetch(fetchRequest).first as? NSManagedObject {
                manager.delete(result)
                try manager.save()
                return retriveLeaguesFromCoreData()
            } else {
                print("Leagues with key \(favLeague.key) not found")
                return []
            }
        } catch let error as NSError {
            print("Error deleting from Core Data: \(error.localizedDescription)")
            return []
        }
    }
    
    
}
