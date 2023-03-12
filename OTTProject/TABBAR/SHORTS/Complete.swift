//
//  Complete.swift
//  OTTProject
//
//  Created by Jo on 29/01/23.
//

import UIKit

class Complete: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1 ) {
            let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TABBAR") as! TABBAR
            self.navigationController?.pushViewController(navg, animated: true)
        }
        // Do any additional setup after loading the view.
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
