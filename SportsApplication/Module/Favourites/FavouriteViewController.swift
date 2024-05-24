//
//  FavouriteViewController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 23/05/2024.
//

import UIKit
import CoreData
import Kingfisher

class FavouriteViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{


    @IBOutlet weak var favouriteTableView: UITableView!
    
    var viewModel: FavouritesViewModelProtocol!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favouriteTableView.delegate = self
        favouriteTableView.dataSource = self
        
        let cell = UINib(nibName: "LeagueCell", bundle: nil)
        self.favouriteTableView.register(cell , forCellReuseIdentifier: "cell")
        
        
        favouriteTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favouriteLeaguesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeagueCell
        cell.myLabel.text = viewModel.favouriteLeaguesArray[indexPath.row].name
        let strImage: String = viewModel.favouriteLeaguesArray[indexPath.row].logo
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
           
            let leagueArray = viewModel.favouriteLeaguesArray
            let league = leagueArray[indexPath.row]
            _ = viewModel.deleteLeagueFromCoreData(favLeague: league)
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

}
