//
//  Profile.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit

class Profile: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btndismis(_ sender: UIButton) {
//        dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
       
    }
   
    // MARK: - Navigation

    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
}
