//
//  homeTVC5.swift
//  OTTProject
//
//  Created by Jo on 16/02/23.
//

import UIKit
import Kingfisher

class homeTVC5: UITableViewCell {
    
    private var demoTvshow : ModelTvshow?
    
    var passTVC5 : IDTVC5!
    
    @IBOutlet var clc5: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        getdata()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
// MARK: - EXTENSION API CALLING
extension homeTVC5 {
    
    func getdata(){
        
        let url = URLcollection.sharedURL.baseURl + URLcollection.sharedURL.tailtvShowUrl + URLcollection.sharedURL.endURL
        
        ApiNetworking.SharedNetwork.callapi(url: url, method: .get) { [self] respdata, isSuccess, Message in
            if isSuccess == true{
                if let datas = respdata{
                    
                    do{
                        let convertedByte = try JSONDecoder().decode(ModelTvshow.self, from: datas)
                        demoTvshow = convertedByte
                        clc5.reloadData()
                    }catch{
                        print("err")
                    }
                }
            }
        }
    }
}

// MARK: - EXTENSION COLLECTIONVIEW

extension homeTVC5 : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return demoTvshow?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvc5CVC5", for: indexPath) as! tvc5CVC5
        cell.imgMV.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoTvshow?.results[indexPath.row].posterPath ?? "")"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 134)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.passTVC5.cvc5(ID: demoTvshow?.results[indexPath.row].id)
    }
}

// MARK: - PROTOCOL
protocol IDTVC5{
    func cvc5(ID : Int?)
}
