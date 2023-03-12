//
//  Sidemenu.swift
//  OTTProject
//
//  Created by Jo on 13/02/23.
//

import UIKit

class Sidemenu: UIViewController {
    
    @IBOutlet var vu: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    @IBAction func btnProfile(_ sender: UIButton) {
        
        let Toprofile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Profile") as! Profile
        
        self.navigationController?.pushViewController(Toprofile, animated: true)
    }
    
    
    @IBAction func btnLanguage(_ sender: UIButton) {
        let Toprofile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Language") as! Language
        self.navigationController?.pushViewController(Toprofile, animated: true)
    }
    
    @IBAction func btnJoners(_ sender: UIButton) {
        let Toprofile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Joners") as! Joners
        self.navigationController?.pushViewController(Toprofile, animated: true)
    }
    
    @IBAction func btnPopular(_ sender: UIButton) {
        let Toprofile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PopularonTV") as! PopularonTV
        self.navigationController?.pushViewController(Toprofile, animated: true)
    }
    
    @IBAction func btnKids(_ sender: UIButton) {
        let Toprofile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "KIdsCorner") as! KIdsCorner
        self.navigationController?.pushViewController(Toprofile, animated: true)
    }
    
    
    
    @IBAction func btnlogut(_ sender: UIButton) {
        let Toprofile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Signin") as! Signin
        self.navigationController?.pushViewController(Toprofile, animated: true)
    }
    
    
    
    
    
    
}
