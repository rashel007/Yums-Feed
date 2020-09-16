//
//  BannerView.swift
//  Yums Feed
//
//  Created by Estique on 9/15/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class BannerView: UIView {
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    
    private var items = [String]()
    private var size = CGSize(width: 0, height: 0)
    
    private var timer = Timer()
    private var pageCounter = 0
    
    override func awakeFromNib() {
        configureNib()
    }
    
    private func configureNib() {
        collectionView.register(BannerCollectionViewCell.nib(), forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func setBannerImages(items: [String], size: CGSize, shouldShowPageView: Bool = false) {
        self.items = items
        self.size = size
        if shouldShowPageView == true {
            pageControl.isHidden = false
            pageControl.numberOfPages = items.count
            pageControl.currentPage = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeImagePostion), userInfo: nil, repeats: true)
        }else {
            pageControl.isHidden = true
        }
        
        collectionView.reloadData()
        
    }
    
    
    @objc
    private func changeImagePostion() {
        print("changeImagePostion")
        if pageCounter <= items.count {
           
            let indexPath = IndexPath(item: pageCounter, section: 0)
            pageControl.currentPage = pageCounter
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
             pageCounter = pageCounter + 1
        }else {
            pageCounter = 0
            let indexPath = IndexPath(item: pageCounter, section: 0)
               pageControl.currentPage = pageCounter
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            pageCounter = 1
        }
        
        
    }
    

}


extension BannerView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as! BannerCollectionViewCell
        cell.configure(imageName: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
