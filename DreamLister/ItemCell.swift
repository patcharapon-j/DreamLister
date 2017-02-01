//
//  ItemCell.swift
//  DreamLister
//
//  Created by Patcharapon Joksamut on 1/27/2560 BE.
//  Copyright © 2560 Patcharapon Joksamut. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    func configCell(item: Item){
        title.text = item.title
        price.text = "\(item.price)"
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
    }
    
    
}
