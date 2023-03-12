//
//  Commingsoon.swift
//  OTTProject
//
//  Created by Jo on 13/02/23.



import UIKit
import Kingfisher

class Commingsoon: UIViewController {
    
    private var demomodel : Modeldata?
    private var  demoToprated : ModelToprated?
    private var demoTrendig : ModelTrending?
    private var demoTvshow : ModelTvshow?
    
    
    
    let commingson = ["Brahmastra part 1","Malayankunj","Avatar"]
    @IBOutlet var lblHead: UILabel!
    
    
    
    
    var num = [Int]()
    var urltail = String()
    var header = String()
    var dic = String()
    @IBOutlet var tbl: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.rowHeight = 283
        getdata()
        lblHead.text = header
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    
    @IBAction func btnDropdown(_ sender: UIButton) {
        
        if num.contains(sender.tag){
            print(num)
            let number = num.lastIndex(of: sender.tag)
            print(number!)
            num.remove(at: number ?? 0)
            
        }else{
            print(sender.tag)
            num.append(sender.tag)
            print(num)
        }
        tbl.reloadData()
        
        //        animation(withduration: 1, delay: 0, animate: csTVC)
        
    }
    
    @IBAction func btnBacktoHome(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //    func animation(withduration : Double , delay : Double , animate : UITableViewCell){
    //        UIView.animate(withDuration: withduration, delay: delay){
    //
    //            if animate.constant == 283{
    //                animate.rowHeight = 545
    //            }else{
    //                animate.rowHeight = 283
    //            }
    //
    //        }
    //    }
    
    
    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
    
}

// MARK: - EXTENSION - TABLEVIEW
extension Commingsoon : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if urltail ==  "/movie/popular"{
            return demomodel?.results.count ?? 0
        }else if urltail == "/movie/top_rated"{
            return demoToprated?.results.count ?? 0
        }else if urltail == "/trending/all/day"{
            return demoTrendig?.results.count ?? 0
        }else {
            return demoTvshow?.results.count ?? 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "csTVC", for: indexPath) as! csTVC
        cell.btndropdown.tag = indexPath.row
        
        if num.contains(indexPath.row){
            cell.btndropdown.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        }else{
            cell.btndropdown.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
        
        
        if urltail ==  "/movie/popular" {
            
            cell.imgMovie.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demomodel?.results[indexPath.row].poster_path ?? "")"))
            cell.lblmvName.text = demomodel?.results[indexPath.row].original_title
            cell.lblbio.text = demomodel?.results[indexPath.row].overview
            
        }else if urltail == "/movie/top_rated"{
            
            cell.imgMovie.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoToprated?.results[indexPath.row].posterPath ?? "")"))
            cell.lblmvName.text = demoToprated?.results[indexPath.row].originalTitle
            cell.lblbio.text = demoToprated?.results[indexPath.row].overview
            
        }else if urltail == "/trending/all/day"{
            
            cell.imgMovie.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoTrendig?.results[indexPath.row].posterPath ?? "")"))
            cell.lblmvName.text = demoTrendig?.results[indexPath.row].originalTitle
            cell.lblbio.text = demoTrendig?.results[indexPath.row].overview
            
        }else{
            
            cell.imgMovie.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoTvshow?.results[indexPath.row].posterPath ?? "")"))
            cell.lblmvName.text = demoTvshow?.results[indexPath.row].originalName
            cell.lblbio.text = demoTvshow?.results[indexPath.row].overview
        }
        
        
        
        if num.contains(indexPath.row){
            cell.v3.isHidden = false
            //            tbl.rowHeight = 545
        }else{
            cell.v3.isHidden = true
            //            tbl.rowHeight = 283
        }
        //        tbl.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        300
        if num.contains(indexPath.row){
            
            return 545
        }else{
            return 283
        }
        
        
        
    }
    
    
}

// MARK: - EXTENSION - API CALLING
extension Commingsoon {
    
    func getdata(){
        
        let Url = URLcollection.sharedURL.baseURl + urltail + URLcollection.sharedURL.endURL
        //        print("-->",Url)
        
        ApiNetworking.SharedNetwork.callapi(url: Url, method: .get) { [self] respdata, isSuccess, Message in
            if isSuccess == true{
                
                if let datas = respdata{
                    
                    do{
                        if urltail ==  "/movie/popular"{
                            
                            let value = try JSONDecoder().decode(Modeldata.self, from: datas)
                            print("-->",value)
                            demomodel = value
                            
                        }else if urltail == "/movie/top_rated"{
                            
                            let value = try JSONDecoder().decode(ModelToprated.self, from: datas)
                            print("-->",value)
                            demoToprated = value
                            
                        }else if urltail == "/trending/all/day"{
                            
                            let value = try JSONDecoder().decode(ModelTrending.self, from: datas)
                            print("-->",value)
                            demoTrendig = value
                            
                        }else {
                            
                            let value = try JSONDecoder().decode(ModelTvshow.self, from: datas)
                            print("-->",value)
                            demoTvshow = value
                            
                        }
                        tbl.reloadData()
                        
                        
                    }catch{
                        print("err")
                    }
                }
                
                
            }
        }
        
    }
}
