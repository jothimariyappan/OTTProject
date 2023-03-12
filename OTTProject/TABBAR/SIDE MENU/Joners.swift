//
//  Joners.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit

class Joners: UIViewController {
    
    let joner = ["Comedy","Drama","Horror","Science fiction","Thriller","Western","Crime film","Narrative","Romance","Adventure","Documentary","Fiction","History","Musical","Fantasy","01","02","03"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btndismiss(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    
    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
    
}
// MARK: - COLLECTIONVIEW

extension Joners : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return joner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "jonersCVC", for: indexPath) as! jonersCVC
        cell.imgJoner.image = UIImage(named: joner[indexPath.item])
        cell.lblJoner.text = joner[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 115, height: 135)
    }
    
}
