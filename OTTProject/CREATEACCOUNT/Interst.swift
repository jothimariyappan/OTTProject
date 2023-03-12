//
//  Interst.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit

class Interst: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet var ns: NSLayoutConstraint!
    @IBOutlet var clc: UICollectionView!
    
    @IBOutlet var btnmore: UILabel!
    @IBOutlet var clcbtm: NSLayoutConstraint!
    let interst = ["Comedy","Drama","Horror","Science fiction","War and military","Western","Crime film","Narrative","Romance","Adventure","Thriller","Fiction","History","Musical","Fantasy","Animation","Epic","Romantic comedy","Documentary","Action","Mystry",]
    var currentSelected :Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        clc.allowsMultipleSelection = true
        //        0.311611
        //        self.clc.frame.size.height = 0.511611 * self.view.frame.size.height
        //        animation(withDuration: 1, delay: 0, animate: ns)
        // Do any additional setup after loading the view.
    }
    //    func animation(withDuration: Double , delay: Double , animate : NSLayoutConstraint){
    //        UIView.animate(withDuration: 1, delay: 0) { [self] in
    //            if animate.constant == 0.311611{
    //                animate.constant = 0.8
    //            }else{
    //                animate.constant = 0.311611
    //            }
    //            self.view.layoutIfNeeded()
    //        }
    //    }
    //
    //    let heightConstraint = NSLayoutConstraint(item: ViewController, attribute: .width, relatedBy: .equal, toItem: clcbtm, attribute: .width, multiplier: 0.25, constant: 0.0)
    //
    //    self.Subview1.frame.size.height = 0.5 × self.view.frame.size.height
    @IBAction func btnmore(_ sender: UIButton) {
        //        animation(withDuration: 1, delay: 0, animate: clcbtm)
        //        if btnmore.text == "More>>"{
        //            btnmore.text = "Less>>"
        //        }else{
        //            btnmore.text = "More>>"
        //        }
        //        if clcbtm.multiplier == 0.311611{
        //            clcbtm.multiplier = 0.311611
        //        }else{
        //            clcbtm.multiplier = 0.311611
        //        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interst.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCVC", for: indexPath) as! interestCVC
        cell.lblInterst.text = interst[indexPath.item]
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        //        cell.backgroundColor = currentSelected == indexPath.row ? UIColor.white : UIColor.clear
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        currentSelected = indexPath.row
        //
        //        clc.reloadData()
        if let cell = collectionView.cellForItem(at: indexPath) as? interestCVC{
            cell.backgroundColor = .white
            cell.lblInterst.textColor = .black
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? interestCVC else{
            return
        }
        cell.lblInterst.textColor = .white
        cell.backgroundColor = .black
    }
    
    
    
    // MARK: - Navigation
    
    @IBAction func btnNext(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Complete") as! Complete
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
    @IBAction func btnSkip(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Complete") as! Complete
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
}
