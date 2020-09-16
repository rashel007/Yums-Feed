//
//  File.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//




public struct HomeItem {
    let id: Int
    let title: String
    let items: [ItemCard]
}


public struct ItemCard {
    let image: String
    let title: String
    let details: String
}
