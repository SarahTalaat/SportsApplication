//
//  LatestEventCell.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import UIKit
import Kingfisher

class LatestEventCell: UICollectionViewCell {

    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var teamOneImage: UIImageView!
    @IBOutlet weak var teamOneLabel: UILabel!
    @IBOutlet weak var teamTwoImage: UIImageView!
    @IBOutlet weak var teamTwoLabel: UILabel!
    let teamImagePlaceholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/EA_Sports_monochrome_logo.svg/2048px-EA_Sports_monochrome_logo.svg.png"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func loadEventData(event: Event?){
        
        dateLabel.text = event?.eventDate
        stadiumLabel.text = "\(event?.eventStadium?.split(separator: "(").first ?? "")"
        roundLabel.text = event?.leagueRound
        teamOneLabel.text = event?.eventHomeTeam
        teamTwoLabel.text = event?.eventAwayTeam
        resultLabel.text = event?.finalResult
        teamOneImage.kf.setImage(with: URL(string: event?.homeTeamLogo ?? teamImagePlaceholder))
        teamTwoImage.kf.setImage(with: URL(string: event?.awayTeamLogo ?? teamImagePlaceholder))
      
    }

}
