//
//  ArtworkCell.swift
//  OhMyHome
//
//  Created by Solo on 02/04/2022.
//

import UIKit

class ArtworkCell: UITableViewCell {

    @IBOutlet weak var artworkImageView: UIImageView!
    static let identifier = "ArtworkCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
