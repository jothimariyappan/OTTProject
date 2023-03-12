//
//  ApiNetworking.swift
//  OTTProject
//
//  Created by Jo on 15/02/23.
//

import Foundation
import Alamofire

class ApiNetworking : NSObject{
    
    static let SharedNetwork = ApiNetworking()
    
    
    func callapi(url : String , method : Method , param : [String:Any]? = nil,completion:@escaping (Data? , Bool, String)->Void){
        
        AF.request(url, method: method == .post ? .post : .get , parameters: param ,encoding: JSONEncoding.default).response { resp in
            switch resp.result{
                
            case .success(let succ):
                completion(succ, true, "OKAY")
            case .failure(_):
                completion(nil,false,"Something issue")
            }
        }
    }
}
enum Method{
    case post , get
}
