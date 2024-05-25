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
    
    var teamDetailsArray: [Result]?
    var sportName: String?
    var teamId: Int?
    var viewModel: TeamsDetailsViewModelProtocol!
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    private func fetchData(){
        print("XXX VC SportName: \(sportName ?? "") , teamID: \(teamId ?? 0)")
        viewModel.getTeamDetails(sport: sportName ?? "", teamId: "\(teamId ?? 0)")
        viewModel.resultToViewController = {  [weak self] in

        DispatchQueue.main.async { [weak self] in
            self?.indicator.stopAnimating()
            self?.teamNameLabel.text = self?.viewModel.teamDetailsArray?[0].team_name
            self?.teamCoachLabel.text = self?.viewModel.teamDetailsArray?[0].coaches?[0].coach_name

            if let playerImage = self?.viewModel.teamDetailsArray?[0].team_logo {
                if let imageUrl = URL(string: playerImage) {
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
            
            self?.teamTableView.reloadData()
            }
        }

    }

//    private func fetchData(){
//        print("XXX VC SportName: \(sportName ?? "") , teamID: \(teamId ?? 0)")
//        viewModel.getTeamDetails(sport: sportName ?? "", teamId: "\(teamId ?? 0)")
//        viewModel.resultToViewController = {  [weak self] in
//            DispatchQueue.main.async { [weak self] in
//                self?.indicator.stopAnimating()
//
//                if let teamDetailsArray = self?.viewModel.teamDetailsArray, !teamDetailsArray.isEmpty {
//                    if let teamName = teamDetailsArray.first?.team_name{
//                        self?.teamNameLabel.text = teamName
//                        if let coachName = teamDetailsArray.first?.coaches?.first?.coach_name {
//                         self?.teamCoachLabel.text = coachName
//                     }
//
//                    }
//
//                }
//                self?.teamTableView.reloadData()
//            }
//        }
//    }





    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.teamDetailsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamDetailsCell
        
        
        if let player = viewModel.teamDetailsArray?.first?.players?[indexPath.row]{
            if let playerName = player.player_name {
                cell.teamDetailsPlayerNameLabel.text = playerName

                if let playerImage = player.player_image {
                    if let imageUrl = URL(string: playerImage) {
                       cell.teamDetailsImage?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "MohamedSalah.jpg") , completionHandler: { (image, error, cacheType, url) in
                           if let image = image {
                               cell.teamDetailsImage?.image = image
                               self.circularImage(cell: cell)
                           } else {
                               cell.teamDetailsImage.image = UIImage(named: "MohamedSalah.jpg")
                               self.circularImage(cell: cell)
                               print("Can't get image")
                           }
                       })
                   } else {
                       print("Can't load image from the internet or image URL is not available")
                       cell.teamDetailsImage.image = UIImage(named: "MohamedSalah.jpg")
                       self.circularImage(cell: cell)
                   }
               }
                }
            }

    

//
//        if let teamDetailsArray = viewModel.teamDetailsArray,
//              indexPath.row < teamDetailsArray.count,
//              let players = teamDetailsArray[indexPath.row].players,
//              !players.isEmpty
//         {
//
//
//        if let player = players.first {
//            if let playerName = player.player_name {
//                cell.teamDetailsPlayerNameLabel.text = playerName
//            }
//
//            if let playerImage = player.player_image,
//               let imageUrl = URL(string: playerImage) {
//                cell.teamDetailsImage?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "cup.jpg") , completionHandler: { (image, error, cacheType, url) in
//                    if let image = image {
//                        cell.teamDetailsImage?.image = image
//                        self.circularImage(cell: cell)
//                    } else {
//                        self.circularImage(cell: cell)
//                        print("Can't get image")
//                    }
//                })
//            }
//            else {
//                print("Can't load image from the internet or image URL is not available")
//                cell.teamDetailsImage.image = UIImage(named: "cup.jpg")
//                self.circularImage(cell: cell)
//            }
//        }
//        }

        return cell
    }

    
    func circularImage(cell: TeamDetailsCell){
        cell.teamDetailsImage?.contentMode = .scaleAspectFill
        cell.teamDetailsImage.frame = CGRect(x: cell.teamDetailsImage.frame.origin.x, y: cell.teamDetailsImage.frame.origin.y, width: 80, height: 80)
        cell.teamDetailsImage?.layer.cornerRadius = cell.teamDetailsImage!.frame.height / 2
        cell.teamDetailsImage?.clipsToBounds = true
    }
    
    

}
