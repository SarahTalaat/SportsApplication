//
//  TeamDetailsCell.swift
//  SportsApplication
//
//  Created by Sara Talat on 25/05/2024.
//

import UIKit

class TeamDetailsCell: UITableViewCell {

    @IBOutlet var teamDetailsImage: UIImageView!
    @IBOutlet var teamDetailsPlayerNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
