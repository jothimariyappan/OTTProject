//
//  PopularonTV.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit

class PopularonTV: UIViewController {
    
    let showname = ["Eshquebaaz","Parineet","Kumkumbaagya","Raadha Krishna"]
    let tv = ["Star Plus","Colors","Zee TV","Star Bharath"]
    
    @IBOutlet var tblpop: UITableView!
    
    private var demoTvshow : ModelTvshow?
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btndis(_ sender: UIButton) {
        
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
// MARK: - Navigation
 
    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
}
// MARK: - TABLEVIEW

extension PopularonTV : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoTvshow?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "popularTVC", for: indexPath) as! popularTVC
        cell.lblShowname.text = demoTvshow?.results[indexPath.row].originalName
        cell.lblTVName.text = "\(demoTvshow?.results[indexPath.row].popularity ?? 0)"
        cell.imgShow.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoTvshow?.results[indexPath.row].backdropPath ?? "")"))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
    
    
}
// MARK: - EXTENSION API CALLING
extension PopularonTV{
    
    func getdata(){
        
        let url = URLcollection.sharedURL.baseURl + URLcollection.sharedURL.tailtvShowUrl + URLcollection.sharedURL.endURL
        
        
        ApiNetworking.SharedNetwork.callapi(url: url, method: .get) { [self] respdata, isSuccess, Message in
            if isSuccess == true{
                
                if let datas = respdata{
                    
                    do{
                        
                        let value = try JSONDecoder().decode(ModelTvshow.self,from: datas)
                        print("value-->",value)
                        demoTvshow = value
                        tblpop.reloadData()
                        
                    }catch{
                        print(error)
                        
                    }
                    
                }
            }
        }
        
        
        
    }
}
