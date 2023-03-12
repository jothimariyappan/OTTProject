//
//  KIdsCorner.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit

class KIdsCorner: UIViewController {
    
    let kids = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btndismis(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Navigation
    
    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
}

// MARK: - COLLECTIONVIEW

extension KIdsCorner : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kidsCVC", for: indexPath) as! kidsCVC
        cell.imgMovies.image = UIImage(named: "\(kids[indexPath.item])")
        cell.imgMovies.layer.cornerRadius = 10
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 115, height: 135)
    }
}
