//
//  PostCellTableViewCell.swift
//  DoggyDatingDeluxeIOS
//
//  Created by Isaiah White-Booth on 4/12/22.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    @IBOutlet weak var captionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
