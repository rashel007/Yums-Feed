//
//  StoryBorded.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit


protocol StoryBorded{
    static func instantiate() -> Self
}


extension StoryBorded where Self : UIViewController {
    
    
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyborde = UIStoryboard(name: "Main", bundle: .main)
        return storyborde.instantiateViewController(identifier: id) as! Self
    }
}
