//
//  Shorts.swift
//  OTTProject
//
//  Created by Jo on 29/01/23.
//

import UIKit

class Shorts: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
}
extension Shorts : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shortsTVC", for: indexPath) as! shortsTVC
//        cell.imgmvLater.image = UIImage(named: Mvlater[indexPath.row])
//        cell.lblmvName.text = Mvlater[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        660
    }
}

