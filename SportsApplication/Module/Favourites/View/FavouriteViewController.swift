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
    var leagueDetailsArray: [LeagueLocal]?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favouriteTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favouriteTableView.delegate = self
        favouriteTableView.dataSource = self
        
        let cell = UINib(nibName: "LeagueCell", bundle: nil)
        self.favouriteTableView.register(cell , forCellReuseIdentifier: "cell")
        
        viewModel = FavouritesViewModel()
        createButton()
        
        leagueDetailsArray = viewModel.retriveLeaguesFromCoreData()
        
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
                        cell.myImage?.contentMode = .scaleAspectFill
                        cell.myImage?.image = image
                        cell.myImage.frame = CGRect(x: cell.myImage.frame.origin.x, y: cell.myImage.frame.origin.y, width: 80, height: 80)
                        cell.myImage?.layer.cornerRadius = cell.myImage!.frame.height / 2
                        cell.myImage?.clipsToBounds = true
                    } else {
                        print("Can't make the image circular")
                    }
            })
        } else {
            print("Can't load image from the internet")
            cell.myImage.image = UIImage(named: "cup.jpg")
            cell.myImage?.contentMode = .scaleAspectFill
            cell.myImage.frame = CGRect(x: cell.myImage.frame.origin.x, y: cell.myImage.frame.origin.y, width: 80, height: 80)
            cell.myImage?.layer.cornerRadius = cell.myImage!.frame.height / 2
            cell.myImage?.clipsToBounds = true
        }

        return cell

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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createButton(){
        // Create a UIButton
        let button = UIButton(type: .system)
        
        // Set the button title and style
        button.setTitle("Tap Me!", for: .normal)
        
        // Set the frame (position and size) of the button
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        
        // Add action for button tap
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(button)
    }
    
    // Action method for button tap
    @objc func buttonTapped() {
        var leagueLocal1 = LeagueLocal(sport: "football", name: "UEFA Europa League", logo: "ss" , key: 4)
        DBManager.favouriteLeagueDB.insert(favleague: leagueLocal1)
        
    }
    

}
