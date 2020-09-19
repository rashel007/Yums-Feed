//
//  SearchTableViewCell.swift
//  Yums Feed
//
//  Created by Estique on 9/19/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet var itemNamelabel: UILabel!
    @IBOutlet var itemCategoryLabel: UILabel!
    
    static let identifier = "SearchTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code  01770252992
    }
    
    
    func configure(item: SearchItem) {
        itemNamelabel.text = item.name
        itemCategoryLabel.text = item.category
    }
    
}
