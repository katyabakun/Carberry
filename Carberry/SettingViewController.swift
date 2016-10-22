//
//  SettingViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 20/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController<SettingsView> {
    override init(){
    super.init()
        let tabBarItem1 = UITabBarItem(title: "", image: UIImage(named: "settings"), tag: 1)
        tabBarItem1.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBarItem = tabBarItem1
    }
    override func viewDidLoad(){
    super.viewDidLoad()
    }
}
