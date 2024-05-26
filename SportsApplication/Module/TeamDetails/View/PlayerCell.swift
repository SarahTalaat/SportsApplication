//
//  PlayerCell.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 25/05/2024.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(player: Player?){
    }
}
