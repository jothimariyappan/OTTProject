//
//  Favorites.swift
//  OTTProject
//
//  Created by Jo on 29/01/23.
//

import UIKit
import Alamofire

class Favorites: UIViewController {
    
    var dc = Koredata()
//    var fav = String()
//    var alamodel = [Modelfav]()
    
//    var zopp : MovieDetails!
    
    @IBOutlet var tblFav: UITableView!
//    private var demomodel : Modeldata?
//    private var  demoToprated : ModelToprated?
//    private var demoTrendig : ModelTrending?
//    private var demoTvshow : ModelTvshow?
//
    private var moviedetail : ModelMovie1?
//    var arraymodel = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
       
//        print(dc.zop)
//        tblFav.layer.backgroundColor = UIColor.white.cgColor
        //        getdata(favid: fav)
        
        //        for element in dc.zop {
        //            let newElement = element
        ////            fav = "\(newElement)"
        //            getdata(favid: "\(newElement)")
        //            tblFav.reloadData()
        //
        ////            print("FAV-->",fav)
        //        }
        //        for i in dc.fetchdata{
        //            fav = "\(dc.zop[0])"
        //        }
        //        print("-=-=-=-",fav)
        // fav.append(dc.fetchdata)
        // Do any additional setup after loading the view.
     
    }
  
//    // MARK: -  VIEWWILLAPPEAR
    override func viewWillAppear(_ animated: Bool) {
        dc.fetch()
//
        tblFav.reloadData()
//        print("willappear",dc.zop)
//////       let myArray = [1, 2, 3, 4, 5]
////        var newArray = [Int]()
//
////        for element in dc.zop {
////            let newElement = element
//            fav = "\(newElement)"
//        }
        
    }
   
    @IBAction func btnsearch(_ sender: UIButton) {
        
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    



}

// MARK: -  EXTENSION - TABLEVIEW
extension Favorites : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        tblFav.reloadData()
        return dc.fetchdata.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteTVC", for: indexPath) as! favoriteTVC
        //        cell.imgmvFav.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(moviedetail?.backdropPath ?? "")"))
        
        
        
        // MARK: -  API FUNCTIONS
        let url = URLcollection.sharedURL.baseURl + "/movie/" + "\(dc.people[indexPath.row].favmovie )" + URLcollection.sharedURL.endURL
        print("urldc-->",url)
        print(dc.people[indexPath.row].favmovie)
        
        ApiNetworking.SharedNetwork.callapi(url: url , method: .get) { [self] respdat, isSuccess, Message in
            if isSuccess == true{
                if let datas = respdat{
                    do{
                        let value = try JSONDecoder().decode(ModelMovie1.self ,from: datas)
                        print("value-->",value)
                        moviedetail = value
                        
                        //                            for i in dc.zop{
                        DispatchQueue.main.async { [self] in
//                                                                cell.imgmvFav.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(moviedetail?.posterPath ?? "")"))
                            cell.imgmvFav.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(moviedetail?.backdropPath ?? "")"))
                            cell.lblFmvName.text = moviedetail?.originalTitle ?? ""
                            
                        }
                        
                        //                            }
                        
                        
                        
                        
                        
                        
                        
                    }catch{
                        
                        print("err")
                        //
                        AF.request(url, method: .get ).responseJSON { [self]  resp in
                            switch resp.result{
                                
                            case .success(let suc):
                                //                                print("alamo",suc)
                                print("alamo",url)
                                if  let value = suc as? [String:Any]{
                                    //                                        print("value",value)
                                    //                                        for i in dc.zop{
                                    cell.imgmvFav.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(value["backdrop_path"] as? String ?? "" )"))
//                                                                          cell.imgmvFav.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(value["poster_path"] as? String ?? "" )"))
                                    
                                    cell.lblFmvName.text = value["original_title"] as? String ?? ""
                                    //                                        }
                                    
                                    
                                }
                                
                                
                                
                            case .failure(_):
                                print("err")
                            }
                        }
                        //
                        //
                    }
                }
              
            }
        }
        
        
        
        return cell
    }
    
    
    // MARK: -  DELETE
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            do{
                try dc.context.delete(dc.fetchdata[indexPath.row])
                tblFav.reloadData()
            }catch{
                print("error")
            }

            self.dc.fetchdata.remove(at: indexPath.row)
            tblFav.reloadData()

        }



    }
}
    //extension Favorites{
    
    //    func getdata(favid : String){
    //
    //        let url = URLcollection.sharedURL.baseURl + "/movie/" + favid   + URLcollection.sharedURL.endURL
    //        print("urldc-->",url)
    //        ApiNetworking.SharedNetwork.callapi(url: url , method: .get) { [self] respdat, isSuccess, Message in
    //            if isSuccess == true{
    //                if let datas = respdat{
    //                    do{
    //                        let value = try JSONDecoder().decode(ModelMovie1.self ,from: datas)
    //                        print("value-->",value)
    ////                        moviedetail = value
    //                        arraymodel.append("\(value)")
    ////
    //                        print("ARRAY",arraymodel )
    //                        print("aracount--->",arraymodel.count)
    //                        tblFav.reloadData()
    //                        for element in dc.zop {
    //                            let newElement = element
    //                            fav = "\(newElement)"
    ////                            getdata()
    //                            tblFav.reloadData()
    //                        }
    //
    //
    //                    }catch{
    //                        print("err")
    ////
    //                        AF.request(url, method: .get ).responseJSON { [self] resp in
    //                            switch resp.result{
    //
    //                            case .success(let suc):
    ////                                print("alamo",suc)
    //
    //                                if  let value = suc as? [[String:Any]]{
    ////                                    print("value",value)
    //                                    for i in value{
    //                                        alamodel.append(Modelfav(fromdata: i))
    //                                    }
    //                                    tblFav.reloadData()
    //
    //                                }
    //
    //
    //                            case .failure(_):
    //                                print("err")
    //                            }
    //                        }
    ////
    ////
    //                    }
    //                }
    //            }
    //        }
    //    }
    //}
    class Modelfav{
        
        var adutlt : String
        var backdrop_path : String
        //    var belongs_to_collection : String ??
        var budget : Int
        //    var genres : String/?
        var homepage : String
        var id : Int
        var original_language : String
        var original_title : String
        var overview : String
        var popularity : Double
        var poster_path : String
        var production_companies : Company1?
        //    var production_countries : String
        var release_date : String
        var revenue : Int
        var runtime : Int
        //    var spoken_languages : ??
        var status : String;
        var    tagline :String
        var    title : String
        var    video : Int
        var    vote_average : Double
        var    vote_count : Int
        
        init(fromdata : [String:Any]) {
            self.adutlt = fromdata["adutlt"] as? String ?? ""
            self.backdrop_path = fromdata["backdrop_path"] as? String ?? ""
            self.budget = fromdata["budget"] as? Int ?? 0
            self.homepage = fromdata["homepage"] as? String ?? ""
            self.id = fromdata["id"] as? Int ?? 0
            self.original_language = fromdata["original_language"] as? String ?? ""
            self.original_title = fromdata["original_title"] as? String ?? ""
            self.overview = fromdata["overview"] as? String ?? ""
            self.popularity = fromdata["popularity"] as? Double ?? 0
            self.poster_path = fromdata["poster_path"] as? String ?? ""
            self.release_date = fromdata["release_date"] as? String ?? ""
            self.revenue = fromdata["revenue"] as? Int ?? 0
            self.runtime = fromdata["runtime"] as? Int ?? 0
            self.status = fromdata["status"] as? String ?? ""
            self.tagline = fromdata["tagline"] as? String ?? ""
            self.title = fromdata["title"] as? String ?? ""
            self.video = fromdata["video"] as? Int ?? 0
            self.vote_average = fromdata["vote_average"] as? Double ?? 0
            self.vote_count = fromdata["vote_count"] as? Int ?? 0
            
            if  let com =  fromdata["production_companies"] as? [String: Any]{
                self.production_companies = Company1(fromcompany: com)
            }
        }
    }
    
    class Company1{
        
        var id : Int
        var logo : String
        var name : String
        var country : String
        
        init(fromcompany : [String:Any]){
            self.id = fromcompany["id"] as? Int ?? 0
            self.logo = fromcompany["logo_path"] as? String ?? ""
            self.name = fromcompany["name"] as? String ?? ""
            self.country = fromcompany["origin_country"] as? String ?? ""
        }
    }
    //"production_companies" =     (
    //            {
    //        id = 120359;
    //        "logo_path" = "<null>";
    //        name = "Ufa-Film";
    //        "origin_country" = XC;
    //    }
    //)
    

