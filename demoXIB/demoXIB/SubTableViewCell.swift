//
//  SubTableViewCell.swift
//  demoXIB
//
//  Created by 松原涼一 on 2023/09/01.
//

import UIKit

class SubTableViewCell: UITableViewCell {

    @IBOutlet weak var subLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
