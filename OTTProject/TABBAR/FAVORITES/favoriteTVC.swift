//
//  favoriteTVC.swift
//  OTTProject
//
//  Created by Jo on 29/01/23.
//

import UIKit

class favoriteTVC: UITableViewCell {
    @IBOutlet var lblFmvName: UILabel!
    @IBOutlet var imgmvFav: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
