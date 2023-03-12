//
//  ChooseLanguage.swift
//  OTTProject
//
//  Created by Jo on 27/01/23.
//

import UIKit

class ChooseLanguage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let language = ["Malayalam","Hindi","English","Tamil","Kannada","Telungu","Punjabi","Bengali","Marathi","Sanskrit","Gugrathi","Kashmiri","Sindhi","Konkani"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - COLLECTIONVIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return language.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chooselanguageCVC", for: indexPath) as! chooselanguageCVC
        cell.imgmovie.image = UIImage(named: language[indexPath.item])
        cell.lblLanguage.text = language[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 165, height: 95)
    }
    
    // MARK: - Navigation
    
    @IBAction func btnNext(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Interst") as! Interst
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
    @IBAction func btnSkip(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TABBAR") as! TABBAR
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
}
