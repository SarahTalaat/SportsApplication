//
//  LeagueDetailsController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import UIKit

class LeagueDetailsController: UIViewController {

    @IBOutlet weak var detailsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let upcomingEventCell = UINib(nibName: "UpComingEventCell", bundle: nil)
        detailsCollectionView.register(upcomingEventCell, forCellWithReuseIdentifier: "UpComingEventCell")
          
          let latestEventCell = UINib(nibName: "LatestEventCell", bundle: nil)
        detailsCollectionView.register(latestEventCell, forCellWithReuseIdentifier: "LatestEventCell")

        let teamCell = UINib(nibName: "TeamCell", bundle: nil)
        detailsCollectionView.register(teamCell, forCellWithReuseIdentifier: "TeamCell")
    }
    

    

}
