//
//  PlayerCell.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 25/05/2024.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var penaltyLabel: UILabel!
    @IBOutlet weak var assistsLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(player: Player?){
        print("loaddding")
        self.playerName.text = player?.player_name
        self.clubNameLabel.text = player?.team_name
        self.assistsLabel.text = "\(player?.assists ?? 0)"
        self.goalsLabel.text = "\(player?.goals ?? 0)"
        self.penaltyLabel.text = "\(player?.penalty_goals ?? 0)"
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
    }
}
