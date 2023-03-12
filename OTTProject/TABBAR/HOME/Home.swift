//
//  Home.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit
import SideMenu
class Home: UIViewController,idpass{
    
    func likeid(favid : Int) {
        print(favid)
        
    }
    var dc1 = MovieDetails()
    private var demoTrendig : ModelTrending?
    
    // Extension 1 = TABLEVIEW
    // Extension 2 = MOVIE ID PASSING
    // Extension 3 =
    
    var someid = [Int]()
    var anicount = 0
    var counter = 20
    
    @IBOutlet var toptab: NSLayoutConstraint!
    
    @IBOutlet var topview: UIView!
    @IBOutlet var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        //
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(imgsug), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let mov = MovieDetails()
        mov.delegate = self
        
    }
    
    @objc func imgsug(){
  
        if anicount  <= 19{
            anicount += 1
            
            if anicount == 20{
                anicount = 0
            }
        }
        tbl.reloadData()
    }
    
    @IBAction func search(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
        
    }
    func topanima(withduration : Double, delay : Double , animate : NSLayoutConstraint){
        
        UIView.animate(withDuration: withduration, delay: delay) { [self] in
            if animate.constant == 50 {
                topview.layer.opacity = 0
                if   topview.layer.opacity == 0{
                    topview.layer.opacity = 1
                }
            }else{
                topview.layer.opacity = 1
                
            }
            self.view.layoutIfNeeded()
        }
        
    }
    
    func topanima2(withduration : Double, delay : Double , animate : NSLayoutConstraint){
        
        UIView.animate(withDuration: withduration, delay: delay) { [self] in
            if animate.constant == 50 {
                topview.layer.opacity = 1
                //                if   topview.layer.opacity == 0{
                //                    topview.layer.opacity = 1
                //                }
            }else{
                topview.layer.opacity = 0
                
            }
            self.view.layoutIfNeeded()
        }
        
    }
    
    // MARK: - BUTTONS --> VIEW MORE
    
    @IBAction func btnmore2(_ sender: UIButton) {
        
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Commingsoon") as! Commingsoon
        commingsoon.urltail = "/movie/popular"
        commingsoon.header = "Poplular"
        
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
    @IBAction func btnmore3(_ sender: UIButton) {
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Commingsoon") as! Commingsoon
        commingsoon.urltail = "/movie/top_rated"
        commingsoon.header = "Top Rated"
        
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
    @IBAction func btnmore4(_ sender: UIButton) {
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Commingsoon") as! Commingsoon
        commingsoon.urltail = "/trending/all/day"
        commingsoon.header = "Trednding"
        
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
    @IBAction func btnmore5(_ sender: UIButton) {
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Commingsoon") as! Commingsoon
        commingsoon.urltail = "/tv/popular"
        commingsoon.header = "TV shows"
        
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
    
    
    
}

//MARK: - TABLEVIEW

extension Home : UITableViewDelegate,UITableViewDataSource{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tbl.isScrollEnabled == true{
            topanima(withduration: 1, delay: 0, animate: toptab)
        }
    }
    
//    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
//        if tbl.isScrollEnabled == true{
//            topanima(withduration: 1, delay: 0, animate: toptab)
//        }
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else if section == 2{
            return 1
        }else if section == 3{
            return 1
        }else {
            return 1
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeTVC1") as! homeTVC1
            
            cell.imgSuggestion.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoTrendig?.results[anicount].backdropPath ?? "")"))
//            print("-->",demoTrendig?.results[indexPath.row].backdropPath)
            
            
            return cell
            
        }else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeTVC2") as! homeTVC2
            cell.passTVC2 = self
            cell.clc.reloadData()
            return cell
            
        }else if indexPath.section == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeTVC3") as! homeTVC3
            cell.passTVC3 = self
            cell.clc2.reloadData()
            return cell
            
        }else if indexPath.section == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeTVC4") as! homeTVC4
            cell.passTVC4 = self
            cell.clc4.reloadData()
            
            return cell
            
        }else  {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeTVC5") as! homeTVC5
            cell.passTVC5 = self
            cell.clc5.reloadData()
            
            return cell
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 222.5
        }else if indexPath.section == 2{
            return 210
        }else{
            return 175
        }
        
    }
}

//MARK: - MOVIE ID-->PASSING

extension Home:IDTVC2, IDTVC3,IDTVC4,IDTVC5{
    
    func cvc5(ID: Int?) {
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetails
        
        commingsoon.movieid =  ID!
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
    func cvc4(ID: Int?) {
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetails
        
        commingsoon.movieid =  ID!
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
    
    func clcdata(ID: Int?) {
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetails
        
        commingsoon.movieid =  ID!
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
    func cvc3(ID: Int?) {
        let commingsoon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetails
        
        commingsoon.movieid =  ID!
        self.navigationController?.pushViewController(commingsoon, animated: true)
    }
    
    
}
// MARK: - EXTENSION - API CALLING
extension Home{
    func getdata(){
        
        let url = URLcollection.sharedURL.baseURl + URLcollection.sharedURL.tailtrendingMovieUrl + URLcollection.sharedURL.endURL
        
        
        
        ApiNetworking.SharedNetwork.callapi(url: url, method: .get) { [self] datas, isSuccess, Meassage in
            if isSuccess == true{
                if let databyte = datas{
                    
                    do{
                        
                        let value = try JSONDecoder().decode(ModelTrending.self,from: databyte)
                        demoTrendig = value
                        print(value)
                        tbl.reloadData()
                    }catch{
                        print("err")
                        
                    }
                }
            }
        }
    }
}

