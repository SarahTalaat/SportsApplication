//
//  LeagueCell.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 20/05/2024.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet var myButton: UIButton!
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
