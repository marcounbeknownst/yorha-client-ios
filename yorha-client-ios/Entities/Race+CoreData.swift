//
//  Race+CoreData.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/28/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation
import CoreData

//Model for remote controller
struct Race: Codable {
    var ID: Int? = 0
    var Name: String? = ""
}

//Model for local controller
public class RaceCD: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RaceCD> {
        return NSFetchRequest<RaceCD>(entityName: "RaceCD");
    }
    
    @NSManaged public var ID: Int32
    @NSManaged public var Name: String?
}

