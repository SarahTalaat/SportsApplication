//
//  TeamCell.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import UIKit
import Kingfisher

class TeamCell: UICollectionViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    let teamImagePlaceholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/EA_Sports_monochrome_logo.svg/2048px-EA_Sports_monochrome_logo.svg.png"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func loadTeamData(team: Team){
      teamName.text = team.team_name
      teamImage.kf.setImage(with: URL(string: team.team_logo ?? teamImagePlaceholder))
    }

}
