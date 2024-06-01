import Foundation
import CoreData
import UIKit

class DBManager: DBManagerProtocol{

    
    
    static let favouriteLeagueDB = DBManager()
    
    var leagues: Array<LeagueLocal>? = []
    var nsManagedLeagues : [NSManagedObject] = []
    let manager : NSManagedObjectContext!
    let favEntity: NSEntityDescription!
    
    var favouriteLeaguesArray: [LeagueLocal] = []
    var favouriteLeagueNSManagedObjectArray: [NSManagedObject] = []
    
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
            print("inserted")
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
    
    

    
    func deleteLeagueFromCoreData(favLeagueKey: Int) -> [NSManagedObject] {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteEntity")
        let predicate = NSPredicate(format: "key == %d", favLeagueKey)
        fetchRequest.predicate = predicate
        
        do {
            if let result = try manager.fetch(fetchRequest).first as? NSManagedObject {
                manager.delete(result)
                try manager.save()
                return retriveLeaguesFromCoreData()
            } else {
                print("Leagues with key \(favLeagueKey) not found")
                return []
            }
        } catch let error as NSError {
            print("Error deleting from Core Data: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteAllFromCoreData() -> [NSManagedObject] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteEntity")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            for object in results {
                if let league = object as? NSManagedObject {
                    managedContext.delete(league)
                }
            }
            try managedContext.save()
            return retriveLeaguesFromCoreData()
        } catch let error as NSError {
            print("Error deleting from Core Data: \(error.localizedDescription)")
            return []
        }
    }

    
    
    
    func convertManagedObjectsToLeagueLocals(nsManagedObjectArray: [NSManagedObject]) -> [LeagueLocal] {
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
