//
//  ActionViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 18/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
class ActionViewController: BaseViewController<ActionView> {
    private var tabBar = ConnectionTabBarController()
    private var connection = Connection()

    override init(){
        super.init()
        
        let tabBarItem1 = UITabBarItem(title: "", image: UIImage(named: "action"), tag: 1)
        tabBarItem1.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBarItem = tabBarItem1
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        tabBar = tabBarController as! ConnectionTabBarController
        connection = tabBar.connection
        self.navigationController?.navigationBar.topItem?.title = "Simple functions"
        // self.navigationController?.pushViewController(ActionViewController(), animated: true)
        self.aView.prostaButton.addTarget(self, action: #selector(btnProstaPressed), for: .touchUpInside)
        self.aView.koloButton.addTarget(self, action: #selector(btnKoloPressed), for: .touchUpInside)
        self.aView.osemkaButton.addTarget(self, action: #selector(btnOsemkaPressed), for: .touchUpInside)
        self.aView.resetButton.addTarget(self, action: #selector(btnResetPressed), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationController?.navigationBar.isTranslucent = true
    }

    func btnResetPressed(){
        let data: Data = "RESET".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)

    }
    func btnProstaPressed(){
        let data: Data = "PROSTA".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
    }
    
    func btnKoloPressed( ){
        let data: Data = "KOLKO".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
    }
    func btnOsemkaPressed (){
        let data: Data = "OSEMKA".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        
    }
}
