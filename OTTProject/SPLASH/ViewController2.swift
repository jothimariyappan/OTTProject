//
//  ViewController2.swift
//  OTTProject
//
//  Created by Jo on 27/01/23.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

  
    @IBAction func btnsignin(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Signin") as! Signin
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
    @IBAction func btnnext(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
}
