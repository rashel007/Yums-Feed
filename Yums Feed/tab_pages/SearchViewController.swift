//
//  SearchViewController.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,StoryBorded {
    
    @IBOutlet var height: NSLayoutConstraint!
    
    @IBOutlet var viewThatwillHideShow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        
        viewThatwillHideShow.isHidden = true
    }
    
    @IBAction func btnSHow(_ sender: Any) {
        
        if viewThatwillHideShow.isHidden == false {
          
        }else {
            viewThatwillHideShow.isHidden = false
        }
    
        
    }
    
    @IBAction func btnHide(_ sender: Any) {
        viewThatwillHideShow.isHidden = true
    }
}
