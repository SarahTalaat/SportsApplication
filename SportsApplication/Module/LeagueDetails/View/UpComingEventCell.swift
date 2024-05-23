//
//  UpComingEventCell.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import UIKit
import Kingfisher

class UpComingEventCell: UICollectionViewCell {

    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var teamOneNameLabel: UILabel!
    @IBOutlet weak var teamTwoNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var teamTwoImage: UIImageView!
    @IBOutlet weak var teamOneImage: UIImageView!
    let teamImagePlaceholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/EA_Sports_monochrome_logo.svg/2048px-EA_Sports_monochrome_logo.svg.png"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func loadEventData(event: Event?){
      eventDateLabel.text = event?.eventDate
      stadiumLabel.text = "\(event?.eventStadium?.split(separator: "(").first ?? "")"
      roundLabel.text = event?.leagueRound
      teamOneNameLabel.text = event?.eventHomeTeam
      teamTwoNameLabel.text = event?.eventAwayTeam

      teamOneImage.kf.setImage(with: URL(string: event?.homeTeamLogo ?? teamImagePlaceholder))
      teamTwoImage.kf.setImage(with: URL(string: event?.awayTeamLogo ?? teamImagePlaceholder))
      
    }


}
