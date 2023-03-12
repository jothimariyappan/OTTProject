//
//  Koredata.swift
//  OTTProject
//
//  Created by Jo on 20/02/23.
//

import Foundation
import UIKit

class Koredata{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchdata = [Entity]()
    var fetchdata2 = [Entity]()
    var people2: [Entity] = []
    var people: [Entity] = []
    var zop = [Int]()
    var check = 0
    
    
    
    
    // MARK: - SAVE
    func save(MOVIE : Int32){
        let likedmovie =  Entity(context: context)
        likedmovie.favmovie = MOVIE
        do{
            try context.save()
            
            print("coredat-SAVED")
            
            
        }catch{
            print("err")
        }
        
        
    }
    
    // MARK: - FETCH
    func fetch(){
        do{
            people = try context.fetch(Entity.fetchRequest())
            fetchdata = people
            print("p1---->",people)
            
        }catch{
            
            print("err")
        }
        
        
        
        //        print("Fetched \(zop.count) people from CoreData")
        //        print("kore -- > data append on zopp--->",zop)
        //        print("moviedeatail_btnlike -->",check)
        //        print(fetchdata.count)
    }
    
    
    
}


