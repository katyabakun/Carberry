//
//  ActionViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 18/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
class ActionViewController: BaseViewController<ActionView> {
    override init(){
        super.init()
        self.view.backgroundColor = UIColor.magentaColor()
        let tabBarItem1 = UITabBarItem(title: "", image: UIImage(named: "action"), tag: 1)
        tabBarItem1.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBarItem = tabBarItem1
    }
    override func viewDidLoad(){
    }
}
