//
//  LeagueViewController.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation

import UIKit
import Kingfisher



class LeagueViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet var leagueTableView: UITableView!
    var viewModel: LeaguesViewModel!
    var sportName: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leagueTableView.dataSource = self
        leagueTableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        let cell = UINib(nibName: "LeagueCell", bundle: nil)
        self.leagueTableView.register(cell , forCellReuseIdentifier: "cell")
        viewModel = LeaguesViewModel()
        
        fetchData()
   
    }
    
    private func fetchData(){
        viewModel.getLeagues(sport: sportName)
        viewModel.resultToViewController = {  [weak self] in
            DispatchQueue.main.async {
                self?.leagueTableView.reloadData()
            }
        }

        

//        viewModel.fetchLeagues { [weak self] in
//            DispatchQueue.main.async {
//                self?.leagueTableView.reloadData()
//            }
//        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.leaguesArray?.count ?? 0
    }

//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = leagueTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeagueCell
//        cell.myLabel.text = viewModel.leaguesArray[indexPath.row].league_name
//        let strImage: String = viewModel.leaguesArray[indexPath.row].country_logo ?? "No image"
//        print(strImage)
//
//        if let imageUrl = URL(string: strImage) {
//
//            cell.myImage?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "loading.png") , completionHandler: {
//                (image, error, cacheType, url) in
//                    if let image = image {
//                        cell.myImage?.contentMode = .scaleAspectFill
//                        cell.myImage?.image = image
//                        cell.myImage?.layer.cornerRadius = cell.myImage!.frame.width / 2
//                        cell.myImage?.clipsToBounds = true
//                    } else {
//                        print("Can't make the image circular")
//                    }
//            })
//        } else {
//            print("Can't load image from the internet")
//        }
//
//        cell.myImage?.layer.cornerRadius = cell.myImage!.frame.width / 2
//        cell.myImage?.clipsToBounds = true
//
//        return cell
//
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeagueCell
        cell.myLabel.text = viewModel.leaguesArray?[indexPath.row].league_name
        let strImage: String = viewModel.leaguesArray?[indexPath.row].league_logo ?? "No image"
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

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      let leagueDetails = self.storyboard?.instantiateViewController(identifier: "LeagueDetailsController") as! LeagueDetailsController
      leagueDetails.sportName = self.sportName
      leagueDetails.leagueId = (viewModel.leaguesArray?[indexPath.row].league_key)!
    
      self.present(leagueDetails, animated: true)

    }
    
       
    
    

}
