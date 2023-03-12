//
//  MovieDetails.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit
import Kingfisher
import Alamofire


class MovieDetails: UIViewController {
    let url1 = "https://api.themoviedb.org/3/movie/315162?api_key=c77c9cdbbe2bfe7557cecde020f92321"
    
    
    var link = Int()
    var delegate : idpass!
    //    var people: [Entity] = []
    //    var zop = [Int]()
    
// MARK: - IBOUTLETS
    
    @IBOutlet var imgLIKE: UIImageView!
    
    @IBOutlet var imgWATCHLATER: UIImageView!
    
    @IBOutlet var imgDOWNLOAD: UIImageView!
    
    @IBOutlet var btnmoreOU: UIButton!
    
    @IBOutlet var imgdown: UIImageView!
    private var moviedetail : ModelMovie1?
    
    //    private var moviedetail2 : ModelMovie2?
    var dc = Koredata()
    @IBOutlet var vuNs: NSLayoutConstraint!
    
    @IBOutlet var imgMain: UIImageView!
    @IBOutlet var lblmovietitle: UILabel!
    @IBOutlet var lblbio: UILabel!
    
    
    @IBOutlet var img1: UIImageView!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var lbl1: UILabel!
    var movieid = Int()
    var check1 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vuNs.constant = 0
        
        getdata()
        print("movieid",movieid)
        
        lbl1.layer.opacity = 0
        lbl2.layer.opacity = 0
        img1.layer.opacity = 0
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        check1 = 0
        print("moviedeatail_viewapper -->",check1)
    }
    
    
    // MARK: - BUTTONS
    
    @IBAction func btnlike(_ sender: UIButton) {
        //        link = movieid
        //        print("linkkk",link)
        dc.save(MOVIE: Int32(movieid))
        //        check1 = 1
        //        dc.check = 1
        //        dc.fetch()
        imgLIKE.image = #imageLiteral(resourceName: "heart")
        
        
    }
    
    
    @IBAction func btnwatchlater(_ sender: UIButton) {
      
    }
    
    
    @IBAction func btndownload(_ sender: UIButton) {
    }
    
   
    @IBAction func btnMore(_ sender: UIButton) {
        
        animation(withduration: 1, deLay: 0, animat: vuNs)
        //        if lbl1.isHidden == true{
        //            lbl1.isHidden = false
        //            lbl2.isHidden = false
        //            img1.isHidden = false
        //        }else{
        //
        //            lbl1.isHidden = true
        //            lbl2.isHidden = true
        //            img1.isHidden = true
        //        }
        animation1(withduration: 1, deLay: 0, animat: img1)
        
    }
    
    
    func animation(withduration: Double , deLay: Double , animat : NSLayoutConstraint){
        UIView.animate(withDuration: withduration, delay: deLay) { [self] in
            if animat.constant == 0{
                animat.constant = 200
                //                img1.isHidden = false
                //                lbl1.isHidden = false
                //                            lbl2.isHidden = false
                
            }else{
                //                img1.isHidden = true
                animat.constant = 0
                
            }
            self.view.layoutIfNeeded()
        }
        
        
        
        
    }
    
    @IBAction func btnsearch(_ sender: UIButton) {
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
    @IBAction func btnbacktohome(_ sender: UIButton) {
        
        //        delegate.likeid(favid: movieid)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    func animation1(withduration: Double , deLay: Double , animat : UIImageView){
        UIImageView.animate(withDuration: withduration, delay: deLay) { [self]  in
            
            if animat.layer.opacity == 0 {
                animat.layer.opacity = 1
                lbl1.layer.opacity = 1
                lbl2.layer.opacity = 1
                btnmoreOU.setTitle("Less", for: .normal)
                imgdown.image = UIImage(systemName: "chevron.up")
            }else{
                animat.layer.opacity = 0
                lbl1.layer.opacity = 0
                lbl2.layer.opacity = 0
                btnmoreOU.setTitle("More", for: .normal)
                imgdown.image = UIImage(systemName: "chevron.down")
            }
            self.view.layoutIfNeeded()
        }
        
    }
}
// MARK: - COLLECTIONVIEW

extension MovieDetails : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviedetailCVC", for: indexPath) as! moviedetailCVC
        //        cell.imgMovie.image = UIImage(named: "\(movie[indexPath.item])")
        //        cell.imgMovie.layer.cornerRadius = 10
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 115, height: 135)
    }
    
}
extension MovieDetails {
    
    func getdata(){
        
        let urlmain = URLcollection.sharedURL.baseURl + "/movie/" + "\(movieid)" + URLcollection.sharedURL.endURL
        print("-0-0-",urlmain)
        
        ApiNetworking.SharedNetwork.callapi(url: urlmain, method: .get) { [self] respdata, isSuccess, Message in
            if isSuccess == true{
                if let datas = respdata{
                    
                    do{
                        let convertedByte = try JSONDecoder().decode(ModelMovie1.self, from: datas)
                        print("byte->",convertedByte)
                        moviedetail = convertedByte
                        print("-->>+",moviedetail!.id)
                        
                        DispatchQueue.main.async { [self] in
                            imgMain.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(moviedetail?.backdropPath ?? "" )" ))
                            lblmovietitle.text =  moviedetail?.title
                            lblbio.text = moviedetail?.overview
                            img1.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(moviedetail?.belongsToCollection.posterPath ?? "")"))
                            lbl1.text = moviedetail?.belongsToCollection.name
                        }
                        
                    }catch{
                        print("Catch")
                        AF.request(urlmain, method: .get).responseJSON { [self] resp in
                            switch resp.result{
                                
                            case .success(let succ):
                                print(succ)
                                
                                if let value1 = succ as? [String:Any]{
                                    //                                    print(value)
                                    lblmovietitle.text = value1["title"] as? String
                                    imgMain.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(value1["poster_path"] as? String ?? "")"))
                                    lblbio.text = value1["overview"] as? String
                                    
                                    if let key1 = value1["production_companies"] as? [[String:Any]]{
                                        print("key1",key1)
                                        //                                        lbl1.text = key1[["name"]] as? String
                                        
                                        
                                    }
                                }
                                
                                
                            case .failure(let err):
                                print(err)
                            }
                        }
                    }
                }
            }
        }
    }
}




class Model{
    
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
    var production_companies : Company?
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
            self.production_companies = Company(fromcompany: com)
        }
    }
}

class Company{
    
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

protocol idpass{
    func likeid(favid : Int)
}
