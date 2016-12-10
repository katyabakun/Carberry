//
//  MainMenuViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

class MainMenuViewController:BaseViewController<MainMenuView>,UINavigationBarDelegate,UIPopoverPresentationControllerDelegate{
    private var tabBar = ConnectionTabBarController()
    private var connection = Connection()
    var currentDeviceOrientation: UIDeviceOrientation = .unknown
    
    override init() {
        super.init()
        
        let tabBarItem1 = UITabBarItem(title: "", image: UIImage(named: "main"), tag: 1)
            tabBarItem1.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        self.tabBarController?.tabBar.clipsToBounds = true
        
        self.tabBarItem = tabBarItem1
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // let rightBarItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(openConnectionVC(_:)))
        
       // self.navigationItem.rightBarButtonItem = rightBarItem
        
        tabBar = tabBarController as! ConnectionTabBarController
        connection = tabBar.connection
        self.navigationController?.navigationBar.topItem?.title = "Main menu"
       // self.navigationController?.pushViewController(ActionViewController(), animated: true)
        self.aView.leftButton.addTarget(self, action: #selector(btnLeftPressed), for: .touchUpInside)
        self.aView.rightButton.addTarget(self, action: #selector(btnRightPressed), for: .touchUpInside)
        self.aView.speedUpButton.addTarget(self, action: #selector(btnOnPressed), for: .touchUpInside)
        self.aView.speedDownButton.addTarget(self, action: #selector(btnOffPressed), for: .touchUpInside)
        
       // self.aView.speedView.speed.text = connection.bufferStr as String
  
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Create the navigation bar
        self.navigationController?.navigationBar.isHidden = false
        
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIApplication.shared.statusBarOrientation == .landscapeLeft{
            self.tabBarController?.tabBar.isHidden = false
        }else if UIApplication.shared.statusBarOrientation == .portrait{
            self.tabBarController?.tabBar.isHidden = true
        }else {
            self.tabBarController?.tabBar.isHidden = false
        }

    }
    func btnLeftPressed(){
        let data: Data = "LEFT".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        
    }
    func btnRightPressed(){
        let data: Data = "RIGHT".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
    }
    
    func btnOnPressed( ){
        let data: Data = "ON".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        connection.inStream?.read(&connection.buffer, maxLength: connection.buffer.count)
        connection.bufferStr = NSString(bytes: &connection.buffer, length: connection.buffer.count, encoding: String.Encoding.utf8.rawValue)!
       
        print(connection.bufferStr)
        self.aView.speedView.speed.text = "\(connection.bufferStr)"
        
    }
    func btnOffPressed (){
        let data: Data = "OFF".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        connection.inStream?.read(&connection.buffer, maxLength: connection.buffer.count)
        connection.bufferStr = NSString(bytes: &connection.buffer, length: connection.buffer.count, encoding: String.Encoding.utf8.rawValue)!
        
        print(connection.bufferStr)
        self.aView.speedView.speed.text = "\(connection.bufferStr)"
        
    }
    func btnAddPressed(){
        let data: Data = "ADD".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
    }
    func btnSubPressed(){
        let data: Data = "SUB".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
