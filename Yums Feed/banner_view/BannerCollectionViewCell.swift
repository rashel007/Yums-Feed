//
//  BannerCollectionViewCell.swift
//  Yums Feed
//
//  Created by Estique on 9/15/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bannerImage: UIImageView!
    
    static let identifier = "BannerCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(imageName: String) {
      bannerImage.image = UIImage(named: imageName)
    }

}
