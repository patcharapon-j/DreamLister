//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Patcharapon Joksamut on 1/27/2560 BE.
//  Copyright © 2560 Patcharapon Joksamut. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: NSSet?

}

// MARK: Generated accessors for toItem
extension ItemType {

    @objc(addToItemObject:)
    @NSManaged public func addToToItem(_ value: Item)

    @objc(removeToItemObject:)
    @NSManaged public func removeFromToItem(_ value: Item)

    @objc(addToItem:)
    @NSManaged public func addToToItem(_ values: NSSet)

    @objc(removeToItem:)
    @NSManaged public func removeFromToItem(_ values: NSSet)

}
