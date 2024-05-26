//
//  MainTableViewCell.swift
//  demoXIB
//
//  Created by 松原涼一 on 2023/08/29.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.image = UIImage(systemName: "location.circle.fill")
//        label1.text = "場所"
//        label2.text = "設定時刻が入る"
        textfield.text  = ""

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
