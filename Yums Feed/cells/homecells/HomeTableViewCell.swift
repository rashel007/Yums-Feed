//
//  HomeTableViewCell.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit


protocol HomeTableViewCellDelegate: AnyObject {
    func didTapMore(item: HomeItem)
}

class HomeTableViewCell: UITableViewCell {
    
    weak var delegate: HomeTableViewCellDelegate?
    

    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    
    
    static let identifier = "HomeTableViewCell"
    
    
    var item: HomeItem?
    var collectionViewItems  = [ItemCard]()
    
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(HomeTableViewCollectionCell.nib(), forCellWithReuseIdentifier: HomeTableViewCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configure(homeItem: HomeItem){
        self.item = homeItem
        titleLabel.text = homeItem.title
        collectionViewItems = homeItem.items
        collectionView.reloadData()
    }
    
    
    @IBAction func buttonMoreTapped(_ sender: Any) {
        
        guard let item = item else {
            return
        }
        
        delegate?.didTapMore(item: item)
    }
    
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTableViewCollectionCell.identifier, for: indexPath) as! HomeTableViewCollectionCell
        cell.configure(cardItem: collectionViewItems[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewItems.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
}
