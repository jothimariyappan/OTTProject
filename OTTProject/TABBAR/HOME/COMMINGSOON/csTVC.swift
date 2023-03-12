//
//  csTVC.swift
//  OTTProject
//
//  Created by Jo on 13/02/23.
//

import UIKit

class csTVC: UITableViewCell {
    
    let cast = ["Ranbeer Kapoor","Alia Bhut","Amitabh Bachan"]
    
    @IBOutlet var clc: UICollectionView!
    @IBOutlet var imgMovie: UIImageView!
    @IBOutlet var lblbio: UILabel!
    
    @IBOutlet var lblmvName: UILabel!
    @IBOutlet var v3: UIView!
    @IBOutlet var btndropdown: UIButton!
    @IBOutlet var vuNS: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
// MARK: - EXTENSION - COLLECTIONVIEW

extension csTVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cntvcCVC" , for: indexPath) as! cntvcCVC
        cell.imgCast.image = UIImage(named: cast[indexPath.row])
        return cell
    }
    
    
    
}
