//
//  TopScorersController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 01/06/2024.
//

import UIKit

class TopScorersController: UIViewController ,UITableViewDataSource {
    
    var viewModel: TopscorersViewModel!
    var indicator: UIActivityIndicatorView!
    var sportName = "football"
    var leagueId = 200

    @IBOutlet weak var topScorerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "PlayerCell", bundle: nil)
        topScorerTableView.register(cell, forCellReuseIdentifier: "PlayerCell")
        
        topScorerTableView.rowHeight = UITableView.automaticDimension
        topScorerTableView.estimatedRowHeight = 100

        viewModel = TopscorersViewModel()
        fetchData()
        showData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if viewModel.player?.isEmpty ?? true {
            indicator = UIActivityIndicatorView(style: .large)
            indicator.center = self.view.center
            self.view.addSubview(indicator)
            indicator.startAnimating()
            fetchData()
        } else {
            topScorerTableView.reloadData()
        }
    }
   
    
    func fetchData(){
        viewModel.getTopScorersDetails(sportName: sportName, leagueId: "\(leagueId)")
    }

    func showData(){
      viewModel.resultToViewController = { [weak self] in

        DispatchQueue.main.async {
          
          self?.topScorerTableView.reloadData()
          self?.indicator.stopAnimating()

        }
      }
    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      cell.backgroundColor = .systemGray6
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.player?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        cell.loadData(player: (self.viewModel.player?[indexPath.row]))

     
        cell.contentView.backgroundColor = .white
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = UIColor.systemGray2.cgColor
        cell.contentView.layer.cornerRadius = 16
      return cell
    }


}

