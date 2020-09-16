//
//  FirstViewController.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, StoryBorded {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var homeItems = [HomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Home"
        configureData()
        configureTableView()
    }
    
    
    private func configureTableView() {
        tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func configureData() {
        
        let itemCard1 = ItemCard(image: "thumb1", title: "Tomato Sauce with Onion and Butter", details: "Card Details 1")
        let itemCard2 = ItemCard(image: "thumb2", title: "Chicken and Broccoli Rabe Stromboli", details: "Card Details 1")
        let itemCard3 = ItemCard(image: "thumb3", title: "Crazy Bread", details: "Card Details 1")
        let itemCard4 = ItemCard(image: "thumb2", title: "Classic Easy Lasagna", details: "Card Details 1")
        let itemCard5 = ItemCard(image: "thumb3", title: "EASY CHICKEN PARMIGIANA", details: "Card Details 1")
        
        let itemCards = [itemCard1, itemCard2, itemCard3,itemCard4, itemCard5]
        
        let homeItem1 = HomeItem(id: 1, title: "5 Minutes", items: itemCards)
        let homeItem2 = HomeItem(id: 1, title: "Itilian", items: itemCards)
        let homeItem3 = HomeItem(id: 1, title: "Indian", items: itemCards)
        let homeItem4 = HomeItem(id: 1, title: "Bangali", items: itemCards)
        let homeItem5 = HomeItem(id: 1, title: "Chinese", items: itemCards)
        let homeItem6 = HomeItem(id: 1, title: "American", items: itemCards)
        let homeItem7 = HomeItem(id: 1, title: "Mexican", items: itemCards)
        
        
        homeItems.append(homeItem1)
        homeItems.append(homeItem2)
        homeItems.append(homeItem3)
        homeItems.append(homeItem4)
        homeItems.append(homeItem5)
        homeItems.append(homeItem6)
        homeItems.append(homeItem7)
    }
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate, HomeTableViewCellDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        
        cell.configure(homeItem: homeItems[indexPath.row])
        cell.collectionView.contentOffset = .zero
        cell.delegate = self
        
        return cell
    }
    
    func didTapMore(item: HomeItem) {
        print(item.title)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
}

