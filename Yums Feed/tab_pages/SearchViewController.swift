//
//  SearchViewController.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,StoryBorded {
    
 
    var tableView: UITableView!
    var searchView: UISearchController!
    var mainItems = [SearchItem]()
    var filterItems = [SearchItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        
        initTableView()
        initSearchView()
  
        addItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView.register(SearchTableViewCell.nib(), forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizesSubviews = true
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60
        
        view.addSubview(tableView)
    }
    
    
    private func initSearchView() {
        print("initSearchView")
        searchView = UISearchController(searchResultsController: nil)
        searchView.searchBar.delegate = self
        searchView.searchBar.placeholder = "Search Here..."
        searchView.searchBar.searchBarStyle = .prominent
        searchView.searchBar.sizeToFit()
        searchView.searchBar.scopeButtonTitles = ["All", "Bangladeshi","Itilian","Indian"]
        searchView.searchResultsUpdater = self
        
        navigationItem.searchController = searchView
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func addItems() {
        let item1 = SearchItem(name: "Panzenella is a Tuscan bread salad, ideal for summer. It does not follow a particular recipe, but the two ingredients that do not change are tomatoes and bread. This salad is great with a chilled glass of Prosecco and lots of sunshine!", category: "Itilian")
        
        let item2 = SearchItem(name: "An antipasto dish, bruschetta has grilled bread topped with veggies, rubbed garlic and tomato mix. A country bread sliced and topped with different toppings - the evergreen tomato-basil and an inventive mushroom-garlic. The classic Italian starter!", category: "Itilian")
        
        let item3 = SearchItem(name: "Focaccia Bread .Fresh dough is topped with caramelized onions, olives, tomato slices, basil leaves, grated parmesan cheese and baked delicious!", category: "Itilian")
        
        let item4 = SearchItem(name: "Pasta Carbonara. This simple Roman pasta dish derives its name from 'carbone' meaning coal. It was a pasta popular with the coal miners. The original recipe calls for guanciale, which is pig's cheek, but since its not easily available, the chef has used bacon instead.", category: "Itilian")
        
        
        let item5 = SearchItem(name: "Pitha are rice cakes that are made sweet or savory and with several types of rice and then soaked in milk and topped with sugar, date palm syrup, jaggery or molasses. The rice cakes can be steamed, fried or in other ways. ", category: "Bangladeshi")
        
        let item6 = SearchItem(name: "Vorta. This is the most common Bangladeshi food of all. Bortha refers to any vegetable that has been cooked and served mashed. This can be anything and everything, from one vegetable only to several, from spicy to mild, from leaves to stems. ", category: "Bangladeshi")
        
        
        let item7 = SearchItem(name: "It's hard to find anyone who doesn't fall in love with tandoori chicken, that famous Indian barbecue chicken recipe. Although traditionally cooked in a clay oven, you can prepare the yogurt-marinated chicken in a regular oven (or on the grill). You do need to plan ahead, as the coated chicken should sit in the refrigerator for at least 6 hours or overnight. If you prefer, you can sear the marinated chicken cubes first on the stovetop to achieve that signature tandoori char.", category: "Indian")
        
        mainItems.append(item5)
        mainItems.append(item6)
        mainItems.append(item1)
        mainItems.append(item2)
        mainItems.append(item3)
        mainItems.append(item4)
        mainItems.append(item7)
        
        filterItems = mainItems
        tableView.reloadData()
        
    }

}


extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        cell.configure(item: filterItems[indexPath.row])
        return cell
    }
    
    
    func filterSearchResult(searchText: String, searchScope: String = "All") {
        
       filterItems = mainItems
        
        filterItems = filterItems.filter { (item: SearchItem) -> Bool in
            let didTypeMatched = (searchScope == "All") ||  (item.category == searchScope)
        
            if isSearchEmpty() {
                return didTypeMatched
            }else {
                return didTypeMatched && item.category.lowercased().contains(searchText.lowercased())
            }
            
        }
        
        print(filterItems.count)
        
        tableView.reloadData()
        
    }
    
    
    func isSearchEmpty() -> Bool {
        return searchView.searchBar.text?.isEmpty ?? true
    }
}

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(searchBar.scopeButtonTitles![selectedScope])
        filterSearchResult(searchText: searchBar.text!, searchScope: searchBar.scopeButtonTitles![selectedScope])
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print(searchView.searchBar.text)
        let searchBar = searchView.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterSearchResult(searchText: searchController.searchBar.text!, searchScope: scope)
    }
    
    
    
}
