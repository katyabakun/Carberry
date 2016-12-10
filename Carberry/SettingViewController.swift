//
//  SettingViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 20/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit


class SettingViewController: BaseViewController<SettingsView>{
    private var tabBar = ConnectionTabBarController()
    private var connection = Connection()
    let motionKit = MotionKit()
    var currentValueSpeed: Double = 0
    
    override init(){
    super.init()
        let tabBarItem1 = UITabBarItem(title: "", image: UIImage(named: "settings"), tag: 1)
        tabBarItem1.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBarItem = tabBarItem1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Accelerometer control"
        
        tabBar = tabBarController as! ConnectionTabBarController
        connection = tabBar.connection

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        motionKit.getAccelerometerValues(1){
            (x, y, z) in
            DispatchQueue.main.async {

                self.aView.xLabel.text = String(x)
                self.aView.yLabel.text = String(y)
                self.aView.zLabel.text = String(z)
                
                self.currentValueSpeed  = abs(self.currentValueSpeed - x)
                
                switch y{
                case (-1..<0):
                    
                    self.aView.leftLabel.backgroundColor = UIColor.red
                    self.aView.rightLabel.backgroundColor = UIColor.white
                    
                case (0..<1):
                    
                    self.aView.rightLabel.backgroundColor = UIColor.red
                    self.aView.leftLabel.backgroundColor = UIColor.white
                    
                default:
                    print("nie działa")
                    self.aView.rightLabel.backgroundColor = UIColor.white
                    self.aView.leftLabel.backgroundColor = UIColor.white
                }
                if self.currentValueSpeed > 0.5{
                    switch x{
                    case (-1..<0):
                        
                        
                        self.aView.plusLabel.backgroundColor = UIColor.red
                        self.aView.minusLabel.backgroundColor = UIColor.white
                        self.btnOnPressed()
                        
                        print(self.currentValueSpeed)
                        
                        
                    case (0..<1):
                        
                        self.aView.minusLabel.backgroundColor = UIColor.red
                        self.aView.plusLabel.backgroundColor = UIColor.white
                        self.btnOffPressed()
                        print(self.currentValueSpeed)
                        
                        
                    default:
                        print("nie działa")
                        self.aView.minusLabel.backgroundColor = UIColor.white
                        self.aView.plusLabel.backgroundColor = UIColor.white
                    }
                }
            }
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        motionKit.stopAccelerometerUpdates()
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
        
        
        /* inStream2!.read(&buffer2, maxLength: buffer2.count)
         let bufferStr = NSString(bytes: &buffer2, length: buffer2.count, encoding: NSUTF8StringEncoding)
         labelSpeed.text = "\(bufferStr!)"*/
        
    }
    func btnOffPressed (){
        let data: Data = "OFF".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        /*inStream2!.read(&buffer2, maxLength: buffer2.count)
         let bufferStr = NSString(bytes: &buffer2, length: buffer2.count, encoding: NSUTF8StringEncoding)
         labelSpeed.text = "\(bufferStr!)"
         
         dane_do_wyswietlania = Int("\(bufferStr!)")
         
         //sliderSpeed.value = Float(dane_do_wyswietlania!) */
    }
    func btnAddPressed(){
        let data: Data = "ADD".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
    }
    func btnSubPressed(){
        let data: Data = "SUB".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
    }
    
}

