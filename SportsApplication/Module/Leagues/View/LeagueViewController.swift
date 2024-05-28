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
    var viewModel: LeaguesViewModelProtocol!
    var sportName: String = " "
    var indicator: UIActivityIndicatorView!
    
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      indicator = UIActivityIndicatorView(style: .large)
      indicator.center = self.view.center
      self.view.addSubview(indicator)
      indicator.startAnimating()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leagueTableView.dataSource = self
        leagueTableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        let cell = UINib(nibName: "LeagueCell", bundle: nil)
        self.leagueTableView.register(cell , forCellReuseIdentifier: "cell")
        
        viewModel = DependencyProvider.leaguesViewModel
        
        fetchData()
   
    }
    
    private func fetchData(){
        viewModel.getLeagues(sport: sportName)
        viewModel.resultToViewController = {  [weak self] in
            DispatchQueue.main.async {
                self?.indicator.stopAnimating()
                self?.leagueTableView.reloadData()
            }
        }

    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.leaguesArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeagueCell
        cell.myLabel.text = viewModel.leaguesArray?[indexPath.row].league_name
        let strImage: String = viewModel.leaguesArray?[indexPath.row].league_logo ?? "No image"
        print(strImage)

        if let imageUrl = URL(string: strImage) {

            cell.myImage?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "cup.jpg") , completionHandler: {
                (image, error, cacheType, url) in
                    if let image = image {
                        cell.myImage?.image = image
                        self.circularImage(cell: cell)
                    } else {
                        self.circularImage(cell: cell)
                        print("Can't get image")
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
    let teamImagePlaceholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/EA_Sports_monochrome_logo.svg/2048px-EA_Sports_monochrome_logo.svg.png"
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let leagueDetails = storyboard.instantiateViewController(identifier: "LeagueDetailsController") as! LeagueDetailsController
        leagueDetails.sportName = self.sportName
        leagueDetails.leagueId = (viewModel.leaguesArray?[indexPath.row].league_key)!
        leagueDetails.leagueName = (viewModel.leaguesArray?[indexPath.row].league_name)!
        leagueDetails.leagueLogo = (viewModel.leaguesArray?[indexPath.row].league_logo) ?? teamImagePlaceholder
        leagueDetails.modalPresentationStyle = .fullScreen
      self.present(leagueDetails, animated: true)

    }
    
       
    
    

}
