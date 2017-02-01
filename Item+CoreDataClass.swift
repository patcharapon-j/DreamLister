//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Patcharapon Joksamut on 1/27/2560 BE.
//  Copyright © 2560 Patcharapon Joksamut. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate
    }
    
}
