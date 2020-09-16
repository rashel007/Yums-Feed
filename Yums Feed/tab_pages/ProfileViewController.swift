//
//  MyRecipesViewController.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, StoryBorded {

    @IBOutlet var imageView: UIView!
    
    @IBOutlet var imageViewBorder: UIView!
    
    @IBOutlet var maleButton: UIButton!
    @IBOutlet var femaleButton: UIButton!
    @IBOutlet var btnUpdate: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        
        imageViewBorder.layer.cornerRadius = imageViewBorder.frame.width / 2
        imageViewBorder.layer.borderWidth = 2
        imageViewBorder.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        
        maleButton.layer.cornerRadius = maleButton.frame.height / 2
        femaleButton.layer.cornerRadius  = femaleButton.frame.height / 2
        
        
        btnUpdate.layer.cornerRadius = btnUpdate.frame.height / 4
//        btnUpdate.layer.shadowColor = UIColor.systemGray5.cgColor
//        btnUpdate.layer.opacity = 1
//        btnUpdate.layer.shadowOffset = .zero
//        btnUpdate.layer.shadowRadius = 10
        

  
    }
    
    @IBAction func maleButtonTapped(_ sender: Any) {
        maleButton.backgroundColor = .systemBlue
        maleButton.setTitleColor(.white, for: .normal)
        femaleButton.backgroundColor = .systemGray5
        femaleButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func femaleButtonTapped(_ sender: Any) {
        femaleButton.backgroundColor = .systemBlue
        femaleButton.setTitleColor(.white, for: .normal)
        maleButton.backgroundColor = .systemGray5
        maleButton.setTitleColor(.black, for: .normal)
    }
}
