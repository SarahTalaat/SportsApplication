//
//  LeaguesViewControllerFactory.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

//import Foundation
//import UIKit
//
//class LeaguesViewControllerFactory {
//    
//    static var network: NetworkProtocol {
//        return Network()
//    }
//    
//    static var viewModel: LeaguesViewModel {
//        return LeaguesViewModel(networkService: self.network)
//    }
//    
//    
//    static func create(with viewModel: LeaguesViewModelProtocol) -> LeagueViewController {
//        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
//        guard let leaguesViewController = storyboard.instantiateViewController(withIdentifier: "LeagueViewController") as? LeagueViewController else{
//            fatalError("Unable to instantiate LeaguesViewController from storyboard")
//        }
//        leaguesViewController.viewModel = viewModel
//        return leaguesViewController
//    }
//    
////
////    static var leaguesTableViewController: LeaguesTableViewController {
////        let leaguesTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
////        leaguesTableViewController.viewModel = viewModel
////        return leaguesTableViewController
////
////    }
//    
//}
