//
//  ConnectionViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ConnectionViewController: BaseViewController<ConnectionView> ,UIPopoverPresentationControllerDelegate,StreamDelegate{
    private var tabBar = ConnectionTabBarController()
    private var connection = Connection()
    let motionKit = MotionKit()
    var bufferStr: NSString?

    var isEnable: Bool = false
    override init(){
    super.init()
        
        let tabBarItem1 = UITabBarItem(title: "", image: UIImage(named: "wifi_2"), tag: 1)
        tabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        self.tabBarController?.tabBar.clipsToBounds = false
        
        self.tabBarItem = tabBarItem1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Connection"

        tabBar = tabBarController as! ConnectionTabBarController
        connection = tabBar.connection
        self.aView.testbuton.addTarget(self, action: #selector(closeStream), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         updateConnectionModel()
        
    }
    func updateConnectionModel(){
        guard let isConnected = self.connection.isConnected else{
            return
        }
            self.aView.connectionButton.addTarget(self, action: #selector(NetworkEnable), for: .touchUpInside)
        
        self.connection.isConnected = !isConnected
        
        
    }
    func closeStream (){
        
        connection.inStream?.close()
        connection.inStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        connection.outStream?.close()
        print("Stop outStream currentRunLoop")
        connection.outStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        connection.isConnected = false
        self.aView.connectionStateLabel.text = "Connection stopped by client"
    }

    func NetworkEnable() {
        

        print("NetworkEnable")
        Stream.getStreamsToHost(withName: ipAdress.addr, port: ipAdress.port, inputStream: &(connection.inStream), outputStream: &(connection.outStream))
        
        
        connection.inStream?.delegate = self
        connection.outStream?.delegate = self
        
        connection.inStream?.schedule(in: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        connection.outStream?.schedule(in: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        
        connection.inStream?.open()
        connection.outStream?.open()
        
        
        let data: Data = "CONNECTED".data(using: String.Encoding.utf8)!
        connection.outStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        
        
    }
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        
        switch eventCode {
        case Stream.Event.endEncountered:
            print("EndEncountered")
            self.aView.connectionStateLabel.text = "Connection stopped by server"
            connection.inStream?.close()
            connection.inStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
            connection.outStream?.close()
            print("Stop outStream currentRunLoop")
            connection.outStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
            
        case Stream.Event.errorOccurred:
            print("ErrorOccurred")
            
            connection.outStream?.close()
            connection.outStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
            connection.inStream?.close()
            connection.inStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
            self.aView.connectionStateLabel.text = "Failed to connect to server"

            
        case Stream.Event.hasBytesAvailable:
            print("HasBytesAvailable")
            self.aView.connectionStateLabel.text = "CONNECTED"

            
        case Stream.Event.hasSpaceAvailable:
            print("HasSpaceAvailable")
             self.aView.connectionStateLabel.text = "CONNECTED"
        case Stream.Event():
            print("None")
        case  Stream.Event.openCompleted:
            print("OpenCompleted")
            self.aView.connectionStateLabel.text = "Open completed"
            
           // self.aView.connectionStateLabel.text = "Connected to server"
          //  self.aView.connectionSwitch.setOn(true, animated: true)
            
        default:
            print("Unknown")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
