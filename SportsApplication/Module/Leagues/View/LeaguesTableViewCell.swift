//
//  LeaguesTableViewCell.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet var myButton: UIButton!
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myImage.layer.cornerRadius = myImage.frame.width / 2
        myImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
