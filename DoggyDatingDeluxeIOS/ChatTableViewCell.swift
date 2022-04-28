//
//  ChatTableViewCell.swift
//  DoggyDatingDeluxeIOS
//
//  Created by Isaiah White-Booth on 4/27/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var chatmessage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
