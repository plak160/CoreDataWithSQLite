//
//  Groups+CoreDataProperties.swift
//  CoreDataWithSQLite
//
//  Created by Plak on 28/05/2024.
//
//

import Foundation
import CoreData


extension Groups {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Groups> {
        return NSFetchRequest<Groups>(entityName: "Groups")
    }

    @NSManaged public var code: String?
    @NSManaged public var name: String?

}

extension Groups : Identifiable {

}
