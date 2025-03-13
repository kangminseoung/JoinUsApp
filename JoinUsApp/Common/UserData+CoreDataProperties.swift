//
//  UserData+CoreDataProperties.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var nickname: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?

}

extension UserData : Identifiable {

}
