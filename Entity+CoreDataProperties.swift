//
//  Entity+CoreDataProperties.swift
//  OTTProject
//
//  Created by Jo on 20/02/23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }
    
    @NSManaged public var favmovie: Int32
 
}

extension Entity : Identifiable {

}
