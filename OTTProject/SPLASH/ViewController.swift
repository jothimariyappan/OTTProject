//
//  ViewController.swift
//  OTTProject
//
//  Created by Jo on 27/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSign(_ sender: UIButton) {
        
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Signin") as! Signin
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    
}

