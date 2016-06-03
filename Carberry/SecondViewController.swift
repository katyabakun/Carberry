//
//  ViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 27/05/16.
//  Copyright © 2016 Katerina Bakun. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {
    
    
    //Network variables
    
    @IBOutlet weak var labelState: UILabel!
    var inStream3 : NSInputStream?
    var outStream3: NSOutputStream?
    
    //Data received
    @IBOutlet weak var image_adhoc_connection: UIImageView!
    var buffer = [UInt8](count: 200, repeatedValue: 0)
    
    var data: String?
    var data3:String?
    @IBOutlet weak var labelStateConnection: UILabel!
    
    @IBAction func buttonProstaLinia(sender: AnyObject) {
        btnLiniaProstaPressed()
    }
    
    @IBAction func buttonOsemka(sender: AnyObject) {
        btnOsemkaPressed()
    }
    @IBAction func buttonKolo(sender: AnyObject) {
        btnKolkoPressed()
    }
    
  
    
    
    @IBAction func buttonTokyoDrift(sender: AnyObject) {
        btnTokyoDriftPressed()
    }
        func btnTokyoDriftPressed(){
        let data: NSData = "DRIFT".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream3?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    func btnLiniaProstaPressed(){
        let data: NSData = "PROSTA".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream3?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    
    func btnKolkoPressed( ){
        let data: NSData = "KOLKO".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream3?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    func btnOsemkaPressed (){
        let data: NSData = "OSEMKA".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream3?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = data3
        if (label == "ON")
        {
            image_adhoc_connection.image = UIImage(named: "adhoc_id.png")
        }
        else
        {
            image_adhoc_connection.image = UIImage(named:"no_signal.png")
        }    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

