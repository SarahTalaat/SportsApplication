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
    
    var sportName: String = "football"
    var teamId: Int = 5
    var viewModel: TeamsDetailsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("xx")
        teamTableView.dataSource = self
        teamTableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        let cell = UINib(nibName: "LeagueCell", bundle: nil)
        self.teamTableView.register(cell , forCellReuseIdentifier: "cell")
        viewModel = TeamsDetailsViewModel()
        
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
        viewModel.getTeamDetails(sport: sportName, teamId: teamId)
        viewModel.resultToViewController = {  [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.teamNameLabel.text = self?.viewModel.teamDetailsArray?[0].result?[0].team_name
                self?.teamCoachLabel.text = self?.viewModel.teamDetailsArray?[0].result?[0].coaches?[0].coach_name
                self?.teamTableView.reloadData()
            }
        }

    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.teamDetailsArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeagueCell
        cell.myLabel.text = viewModel.teamDetailsArray?[indexPath.row].result?[indexPath.row].players?[indexPath.row].player_name
        let strImage: String = viewModel.teamDetailsArray?[indexPath.row].result?[indexPath.row].team_logo ?? "No image"
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
        cell.myImage.frame = CGRect(x: cell.myImage.frame.origin.x, y: cell.myImage.frame.origin.y, width: 80, height: 80)
        cell.myImage?.layer.cornerRadius = cell.myImage!.frame.height / 2
        cell.myImage?.clipsToBounds = true
    }
    
    
}
