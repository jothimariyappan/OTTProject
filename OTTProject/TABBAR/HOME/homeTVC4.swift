//
//  homeTVC4.swift
//  OTTProject
//
//  Created by Jo on 16/02/23.
//

import UIKit
import Kingfisher

class homeTVC4: UITableViewCell {
    
    var passTVC4 : IDTVC4!
    
    @IBOutlet var clc4: UICollectionView!
    private var demoTrendig : ModelTrending?
    @IBOutlet var lblCommingsoon: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        getdata()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
// MARK: - EXTENSION API CALLING
extension homeTVC4{
    
    func getdata(){
        
        let url = URLcollection.sharedURL.baseURl + URLcollection.sharedURL.tailtrendingMovieUrl + URLcollection.sharedURL.endURL
        
        ApiNetworking.SharedNetwork.callapi(url: url, method: .get) { [self] respdata, isSucces, Message in
            if isSucces == true{
                
                if let datas = respdata{
                    
                    do{
                        let convertedBytes = try JSONDecoder().decode(ModelTrending.self, from: datas)
                        demoTrendig = convertedBytes
                        clc4.reloadData()
                        
                    }catch{
                        print("err")
                    }
                }
            }
        }
    }
}

// MARK: - EXTENSION - COLLECTIONVIEW

extension homeTVC4: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return demoTrendig?.results.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvc4CVC4", for: indexPath) as! tvc4CVC4
        cell.imgMVTrending.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoTrendig?.results[indexPath.row].posterPath ?? "")"))
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 114, height: 134)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.passTVC4.cvc4(ID: demoTrendig?.results[indexPath.row].id)
        
    }
}
protocol IDTVC4{
    func cvc4(ID : Int?)
}
