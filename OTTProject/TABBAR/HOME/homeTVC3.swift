//
//  homeTVC3.swift
//  OTTProject
//
//  Created by Jo on 16/02/23.
//

import UIKit
import Kingfisher

class homeTVC3: UITableViewCell {
    
    private var  demoToprated : ModelToprated?
    
    var passTVC3 : IDTVC3!
    @IBOutlet var clc2: UICollectionView!
    @IBOutlet var lblcontinuewatching: UILabel!
    
    var num = [1,2,3,4,5,6,7,8,9,10]
    override func awakeFromNib() {
        super.awakeFromNib()
        clc2.reloadData()
        getdata()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
// MARK: - EXTENSTION - API CALLING
extension homeTVC3{
    
    func getdata(){
        
        let url = URLcollection.sharedURL.baseURl + URLcollection.sharedURL.tailtopRatedMoiveUrl + URLcollection.sharedURL.endURL
        print("url",url)
        
        ApiNetworking.SharedNetwork.callapi(url: url, method: .get) { [self] respdata, isSuccess, Message in
            if isSuccess == true{
                
                if let datas = respdata{
                    do{
                        let value = try JSONDecoder().decode(ModelToprated.self, from: datas)
                        print("->->",value)
                        demoToprated = value
                        
                        clc2.reloadData()
                    }catch{
                        print("-->err")
                    }
                }
            }
        }
        
    }
}

// MARK: -  COLLECTIONVIEW
extension homeTVC3 : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvc3CVC3", for: indexPath) as! tvc3CVC3
        cell.imgmvCW.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(demoToprated?.results[indexPath.row].posterPath ?? "")"))
        cell.lblcount.text = "\(num[indexPath.item])"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 154)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.passTVC3.cvc3(ID: demoToprated?.results[indexPath.row].id )
        clc2.reloadData()
        
    }
    
}
// MARK: - PROTOCOL
protocol IDTVC3{
    func cvc3(ID : Int?)
}
