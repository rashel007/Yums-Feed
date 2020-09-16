//
//  HeaderCollectionReusableView.swift
//  Yums Feed
//
//  Created by Estique on 9/16/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    
     static let identifier = "HeaderCollectionReusableView"
    private var bannderView: BannerView!
    
    func configure(items: [String], size: CGSize, shouldSHowPageView: Bool = false) {
        bannderView = (Bundle.main.loadNibNamed("BannerView", owner: self, options: nil)?.first as! BannerView)
        
        bannderView.setBannerImages(items: items, size: size, shouldShowPageView: shouldSHowPageView)
        addSubview(bannderView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bannderView.frame = bounds
    }
    
    
    
    
    
        
}
