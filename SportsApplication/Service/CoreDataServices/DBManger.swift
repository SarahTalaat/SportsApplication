//
//  DBManger.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 20/05/2024.
//

import Foundation
import CoreData
import UIKit

class DBManager{
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
    
    
    
}
