//
//  Language.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit

class Language: UIViewController {
    let language = ["Malayalam","Hindi","English","Tamil","Kannada","Telungu","Punjabi","Bengali","Marathi","Sanskrit","Gugrathi","Kashmiri","Sindhi","Konkani"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btndismis(_ sender: UIButton) {
        
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
// MARK: - COLLECTIONVIEW

extension Language : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return language.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "languageCVC", for: indexPath) as! languageCVC
        cell.img.image = UIImage(named: language[indexPath.item])
        cell.lblLanguage.text = language[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 165, height: 95)
    }
    
}
