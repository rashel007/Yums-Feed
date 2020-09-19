//
//  CategoryCollectionViewCell.swift
//  Yums Feed
//
//  Created by Estique on 9/16/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "CategoryCollectionViewCell"

    
    @IBOutlet var itemImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemImageView.layer.cornerRadius = 10
    }
    
    
    func configure(imageName: String){
        itemImageView.image = UIImage(named: imageName)
    }

}
