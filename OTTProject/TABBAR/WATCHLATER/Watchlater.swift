//
//  Watchlater.swift
//  OTTProject
//
//  Created by Jo on 29/01/23.
//

import UIKit
import Alamofire

class Watchlater: UIViewController {
    
    let Mvlater = ["JugJug Jeeyo","GanguBai","Jai Bhim","The Batman"]

    @IBOutlet var tbllater: UITableView!
    var dc = Koredata()
    private var moviedetail : ModelMovie1?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// MARK: - VIEWWILLAPPEAR
    override func viewWillAppear(_ animated: Bool) {
        
//        dc.fetch2()
        tbllater.reloadData()
        print("willappear",dc.zop)


    }
    
    @IBAction func btnsearch(_ sender: UIButton) {
        
        
        let presenserach = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Searchbar") as! Searchbar
        
        self.present(presenserach, animated: true, completion: nil)
    }
    
}

// MARK: -  EXTENSION - TABLEVIW
extension Watchlater : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Mvlater.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "watchlaterTVC", for: indexPath) as! watchlaterTVC
        
        cell.imgmvLater.image = UIImage(named: Mvlater[indexPath.row])
        cell.lblmvName.text = Mvlater[indexPath.row]
        // MARK: -  API FUNCTIONS
//                let url = URLcollection.sharedURL.baseURl + "/movie/" +  "\(dc.people2[indexPath.row].latermovie )" + URLcollection.sharedURL.endURL
//                print("urldc-->",url)
//                print(dc.people2[indexPath.row].latermovie)
//
//                ApiNetworking.SharedNetwork.callapi(url: url , method: .get) { [self] respdat, isSuccess, Message in
//                    if isSuccess == true{
//                        if let datas = respdat{
//                            do{
//                                let value = try JSONDecoder().decode(ModelMovie1.self ,from: datas)
//                                print("value-->",value)
//                                moviedetail = value
//
//                                //                            for i in dc.zop{
//                                DispatchQueue.main.async { [self] in
//        //                                                                cell.imgmvFav.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(moviedetail?.posterPath ?? "")"))
//                                    cell.imgmvLater.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(moviedetail?.backdropPath ?? "")"))
//                                    cell.lblmvName.text = moviedetail?.originalTitle ?? ""
//
//                                }
//
//                                //                            }
//
//
//
//
//
//
//
//                            }catch{
//
//                                print("err")
//                                //
//                                AF.request(url, method: .get ).responseJSON { [self]  resp in
//                                    switch resp.result{
//
//                                    case .success(let suc):
//                                        //                                print("alamo",suc)
//                                        print("alamo",url)
//                                        if  let value = suc as? [String:Any]{
//                                            //                                        print("value",value)
//                                            //                                        for i in dc.zop{
//                                            cell.imgmvLater.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(value["backdrop_path"] as? String ?? "" )"))
//        //                                                                          cell.imgmvFav.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(value["poster_path"] as? String ?? "" )"))
//
//                                            cell.lblmvName.text = value["original_title"] as? String ?? ""
//                                            //                                        }
//
//
//                                        }
//
//
//
//                                    case .failure(_):
//                                        print("err")
//                                    }
//                                }
//
//                            }
//                        }
//
//                    }
//                }
        
        return cell
    }
    
    
    // MARK: -  DELETE
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            print("Deleted")
    //            do{
    //                try dc.context.delete(dc.fetchdata[indexPath.row])
    //                tblFav.reloadData()
    //            }catch{
    //                print("error")
    //            }
    //
    //            self.dc.fetchdata.remove(at: indexPath.row)
    //            tblFav.reloadData()
    //
    //        }
    
    
}
