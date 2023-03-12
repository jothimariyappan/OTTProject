//
//  homeTVC2.swift
//  OTTProject
//
//  Created by Jo on 28/01/23.
//

import UIKit
import Kingfisher

class homeTVC2: UITableViewCell,idpass {
    func likeid(favid: Int) {
        
    }
    
    var MD = MovieDetails()
    var passTVC2 : IDTVC2!
    
    
    private var demomodel : Modeldata?
    
    @IBOutlet var btnMORE2: UIButton!
    var dc = Home()
    var cellId = "Cell"
    var celltwoCellId = "CellTwoCell"
    let movie = ["Thiruchithambalam","Zootopia","Spiderman Home coming","Thallumaala"]
    
    @IBOutlet var clc: UICollectionView!
    var num = String()
    var num1 = [1,2,3,4,5,]
    var num2 = [1,2,3,4,5,]
    @IBOutlet var lblHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        getdata()
        clc.delegate = self
        clc.dataSource = self
        clc.reloadData()
        
        MD.delegate = self
        
        
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var isBigger = false
    func configure(isBig: Bool){
        isBigger = isBig
        
    }
    
}
// MARK: - EXTENSION - API CALLING
extension homeTVC2 {
    
    func getdata(){
        
        let Url = URLcollection.sharedURL.baseURl + URLcollection.sharedURL.tailURl + URLcollection.sharedURL.endURL
        //        print("-->",Url)
        
        ApiNetworking.SharedNetwork.callapi(url: Url, method: .get) { [self] respdata, isSuccess, Message in
            if isSuccess == true{
                
                if let datas = respdata{
                    
                    do{
                        let value = try JSONDecoder().decode(Modeldata.self, from: datas)
                        //                        print("-->",value)
                        demomodel = value
                        print("-->>",demomodel?.results[0].id)
                        clc.reloadData()
                        
                    }catch{
                        print("err")
                    }
                }
                
                
            }
        }
        
    }
    
}

// MARK: - EXTENSION - COLLECTIONVIEW

extension homeTVC2 : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return demomodel?.results.count ?? 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvc2CVC2", for: indexPath) as! tvc2CVC2
        cell.imgMovies.kf.setImage(with: URL(string:"https://image.tmdb.org/t/p/w500\(demomodel?.results[indexPath.item].poster_path ?? "")"))
        
        return cell
        clc.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 134)
        //        if indexPath.section == 0{
        //
        //        }else{
        //            return CGSize(width: 114, height: 134)
        //        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.passTVC2.clcdata(ID: demomodel?.results[indexPath.row].id )
        clc.reloadData()
    }
    
}
protocol IDTVC2{
    
    func clcdata(ID : Int?)
    
}
