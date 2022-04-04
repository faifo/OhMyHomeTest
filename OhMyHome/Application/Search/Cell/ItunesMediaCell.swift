//
//  ItunesMediaCell.swift
//  OhMyHome
//
//  Created by Solo on 02/04/2022.
//

import UIKit

class ItunesMediaCell: UITableViewCell {

    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    static let identifier = "ItunesMediaCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resetCellData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resetCellData() {
        kindLabel.text = nil
        titleLabel.text = nil
        artworkImageView.image = nil
    }
    
}
