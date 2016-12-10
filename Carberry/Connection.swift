//
//  Stream.swift
//  Carberry
//
//  Created by Katerina Bakun on 03/11/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Equatable Protocol implementation


class Connection: NSObject{
    var speed: String?
    var inStream : InputStream?
    var outStream: OutputStream?
    var buffer = [UInt8](repeating: 0, count: 200)
    var isConnected: Bool? = false
    var bufferStr = NSString()
}

class ConnectionTabBarController:UITabBarController{
    let connection = Connection()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = AppColor.appGrey
        self.tabBar.tintColor = UIColor.white
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = AppColor.appLightGray
        } else {
            // Fallback on earlier versions
        }
       
    }
}
class CarberryNavController: UINavigationController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationBar.barTintColor = AppColor.darkGrey
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: AppColor.appOrange, NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20.0)]
        
        
    }
    
}
