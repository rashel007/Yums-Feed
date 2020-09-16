//
//  HomeTableViewCollectionCell.swift
//  Yums Feed
//
//  Created by Estique on 9/14/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class HomeTableViewCollectionCell: UICollectionViewCell {
    
    
    static let identifier = "HomeTableViewCollectionCell"
    
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    func configure(cardItem: ItemCard){
        foodImage.image = UIImage(named: cardItem.image)
        foodTitle.text = cardItem.title
    }
    
}
