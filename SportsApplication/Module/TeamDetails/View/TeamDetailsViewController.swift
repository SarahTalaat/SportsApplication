//
//  TeamDetailsViewController.swift
//  SportsApplication
//
//  Created by Sara Talat on 25/05/2024.
//

import UIKit

class TeamDetailsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var teamTableView: UITableView!

    @IBOutlet var teamCoachLabel: UILabel!
    @IBOutlet var teamNameLabel: UILabel!
    
    var teamDetailsArray: [ResultTeamDetails]?
    var sportName: String?
    var teamId: Int?
    var viewModel: TeamsDetailsViewModelProtocol!
    var indicator: UIActivityIndicatorView!

    
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      indicator = UIActivityIndicatorView(style: .large)
//      indicator.center = self.view.center
//      self.view.addSubview(indicator)
//      indicator.startAnimating()
//    }
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        if viewModel.teamDetailsArray?.isEmpty ?? true {
            indicator = UIActivityIndicatorView(style: .large)
            indicator.center = self.view.center
            self.view.addSubview(indicator)
            indicator.startAnimating()
            fetchData()
        } else {
            teamTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("xx")
        teamTableView.dataSource = self
        teamTableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        let cell = UINib(nibName: "TeamDetailsCell", bundle: nil)
        self.teamTableView.register(cell , forCellReuseIdentifier: "cell")
        viewModel = DependencyProvider.teamDetailsViewModel
        
        var arrCount = viewModel.teamDetailsArray?.count
        print("TeamArrayCount: \(arrCount ?? 55555555)")
        
        
        
        fetchData()
    }
    

    
    
    private func fetchData(){
        print("XXX VC SportName: \(sportName ?? "") , teamID: \(teamId ?? 0)")
        viewModel.getTeamDetails(sport: sportName ?? "", teamId: "\(teamId ?? 0)")
        viewModel.resultToViewController = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.indicator.stopAnimating()
                
                if let teamDetailsArray = self?.viewModel.teamDetailsArray, !teamDetailsArray.isEmpty {
            
                    if let teamName = teamDetailsArray.first?.team_name {
                        self?.teamNameLabel.text = teamName
                    }else{
                        self?.teamNameLabel.text = "El Ahly"
                    }
                    if let coachName = teamDetailsArray.first?.coaches?.first?.coach_name {
                        self?.teamCoachLabel.text = coachName
                    }else{
                        self?.teamCoachLabel.text = "Smith"
                    }
                    
                    print("Players Count: \(teamDetailsArray[0].players?.count)")
          
                    if let teamImage = self?.viewModel.teamDetailsArray?[0].team_logo {
                            if let imageUrl = URL(string: teamImage) {
                                self?.teamImage?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "MohamedSalah.jpg") , completionHandler: { (image, error, cacheType, url) in
                                   if let image = image {
                                       self?.teamImage?.image = image
            
                                   } else {
                                       self?.teamImage?.image = UIImage(named: "MohamedSalah.jpg")
            
                                       print("Can't get image")
                                   }
                               })
                           } else {
                               print("Can't load image from the internet or image URL is not available")
                               self?.teamImage?.image = UIImage(named: "MohamedSalah.jpg")
            
                           }
                       }
            
                }
                self?.teamTableView.reloadData()
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Ensure that the teamDetailsArray is not nil and contains at least one element
        guard let teamDetailsArray = viewModel.teamDetailsArray, !teamDetailsArray.isEmpty else {
            return 0
        }
        
        // Sum up the total number of players across all teams
        let totalPlayersCount = teamDetailsArray.reduce(0) { (result, team) in
            if let playersCount = team.players?.count {
                return result + playersCount
            } else {
                return result
            }
        }
        
        return totalPlayersCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamDetailsCell
        
   
        guard let teamDetailsArray = viewModel.teamDetailsArray, !teamDetailsArray.isEmpty else {
            return cell
        }
        

        var playerIndex = indexPath.row
        var teamIndex = 0
        
     
        while playerIndex >= teamDetailsArray[teamIndex].players?.count ?? 0 {
            playerIndex -= teamDetailsArray[teamIndex].players?.count ?? 0
            teamIndex += 1
            

            if teamIndex >= teamDetailsArray.count {
                break
            }
        }
        

        if let player = teamDetailsArray[teamIndex].players?[playerIndex] {

            if let playerName = player.player_name {
                cell.teamDetailsPlayerNameLabel.text = playerName
            }
            
  
            if let playerImageStr = player.player_image, let imageUrl = URL(string: playerImageStr) {
                cell.teamDetailsImage.kf.setImage(with: imageUrl, placeholder: UIImage(named: "MohamedSalah.jpg"), completionHandler: { (image, error, cacheType, url) in
                    if let image = image {
                        cell.teamDetailsImage.image = image
                     
                    } else {
                        cell.teamDetailsImage.image = UIImage(named: "MohamedSalah.jpg")
                        
                        print("Can't get image")
                    }
                })
            } else {
                print("Can't load image from the internet or image URL is not available")
                cell.teamDetailsImage.image = UIImage(named: "MohamedSalah.jpg")
               
            }
        }
        
        return cell
    }

    
    func circularImage(cell: TeamDetailsCell){
        cell.teamDetailsImage?.contentMode = .scaleAspectFill
        cell.teamDetailsImage.frame = CGRect(x: cell.teamDetailsImage.frame.origin.x, y: cell.teamDetailsImage.frame.origin.y, width: 80, height: 80)
        cell.teamDetailsImage?.layer.cornerRadius = cell.teamDetailsImage!.frame.height / 2
        cell.teamDetailsImage?.clipsToBounds = true
    }
    
    

}
