//
//  FavouriteViewController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 23/05/2024.
//

import UIKit
import CoreData
import Kingfisher
import Reachability

class FavouriteViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{


    @IBOutlet weak var favouriteTableView: UITableView!
    
    var viewModel: FavouritesViewModel!
    var leagueDetailsArray: [LeagueLocal]? {
        didSet {
            favouriteTableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        leagueDetailsArray = viewModel.retriveLeaguesFromCoreData()
        favouriteTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favouriteTableView.delegate = self
        favouriteTableView.dataSource = self
        
        let cell = UINib(nibName: "LeagueCell", bundle: nil)
        self.favouriteTableView.register(cell , forCellReuseIdentifier: "cell")
        
        viewModel = DependencyProvider.favouritesViewModel

        
        favouriteTableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueDetailsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeagueCell
        cell.myLabel.text = leagueDetailsArray?[indexPath.row].name
        let strImage: String = leagueDetailsArray?[indexPath.row].logo ?? "No logo"
        print(strImage)

        if let imageUrl = URL(string: strImage) {

            cell.myImage?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "cup.jpg") , completionHandler: {
                (image, error, cacheType, url) in
                    if let image = image {
                        cell.myImage?.image = image
                        self.circularImage(cell: cell)
                    } else {
                        self.circularImage(cell: cell)
                        print("Can't get the image from the url")
                   
                    }
            })
        } else {
            print("Can't load image from the internet")
            cell.myImage.image = UIImage(named: "cup.jpg")
            self.circularImage(cell: cell)
        }
        return cell

    }
    
    func circularImage(cell: LeagueCell){
        cell.myImage?.contentMode = .scaleAspectFill
        cell.myImage.frame = CGRect(x: cell.myImage.frame.origin.x, y: cell.myImage.frame.origin.y, width: 70, height: 70)
        cell.myImage?.layer.cornerRadius = cell.myImage!.frame.height / 2
        cell.myImage?.clipsToBounds = true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           
            let leagueArray = leagueDetailsArray
            let league = leagueArray?[indexPath.row]
            leagueDetailsArray?.removeAll()
            leagueDetailsArray = viewModel.deleteLeagueFromCoreData(favLeague: league ?? LeagueLocal(sport: "FootballNil", name: "NameNil", logo: "LogoNil", key: 00000))
           
            favouriteTableView.reloadData()
            

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reachability = try! Reachability()
        if(reachability.connection == .unavailable){

            print("No internet connection")
            showAlert(withTitle: "There is no internet connection")
            
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let leagueDetails = storyboard.instantiateViewController(identifier: "LeagueDetailsController") as! LeagueDetailsController
            leagueDetails.sportName = (viewModel.favouriteLeaguesArray[indexPath.row].sport)
            leagueDetails.leagueId = (viewModel.favouriteLeaguesArray[indexPath.row].key)
            leagueDetails.leagueName = (viewModel.favouriteLeaguesArray[indexPath.row].name)
            leagueDetails.leagueLogo = (viewModel.favouriteLeaguesArray[indexPath.row].logo)
            leagueDetails.modalPresentationStyle = .fullScreen
          self.present(leagueDetails, animated: true)
            
            
        }
    }

    
    func showAlert(withTitle title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    

    

}
