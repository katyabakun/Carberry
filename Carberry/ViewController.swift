//
//  ViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 27/05/16.
//  Copyright © 2016 Katerina Bakun. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    //Network variables
    
    @IBOutlet weak var labelState: UILabel!
    var inStream2 : NSInputStream?
    var outStream2: NSOutputStream?

    //Data received
    var buffer = [UInt8](count: 200, repeatedValue: 0)
    var data2:String?

    
    var data: String?
    
    @IBAction func buttonAdd(sender: AnyObject) {
        btnAddPressed()
    }

    @IBAction func buttonSub(sender: AnyObject) {
        btnSubPressed()
    }
    
    @IBAction func buttonRight(sender: AnyObject) {
    btnRightPressed()
    }
    
    @IBAction func buttonLeft(sender: AnyObject) {
        btnLeftPressed()
    }
    @IBOutlet weak var sliderSpeed: UISlider!
    
    @IBAction func speedChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        
        labelSpeed.text = "\(currentValue)"
    }
    @IBOutlet weak var labelSpeed: UILabel!
   
  /*  @IBAction func buttonRight(sender: AnyObject) {
        btnRightPressed()
    }
    @IBAction func buttonSub(sender: AnyObject) {
        btnSubPressed()
    }
    
    @IBAction func buttonAdd(sender: AnyObject) {
        btnAddPressed()
    }
    @IBAction func buttonOsemka(sender: AnyObject) {
        
    }
    @IBAction func buttonLeft(sender: AnyObject) {
        btnLeftPressed()
    }
    @IBAction func buttonOn(sender: AnyObject) {
        btnOnPressed()
    }
    
    @IBAction func buttonOff(sender: AnyObject) {
        btnOffPressed()
    }
*/
    func btnLeftPressed(){
        let data: NSData = "LEFT".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream2?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    func btnRightPressed(){
        let data: NSData = "RIGHT".dataUsingEncoding(NSUTF8StringEncoding)!
       outStream2?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    
    func btnOnPressed( ){
        let data: NSData = "ON".dataUsingEncoding(NSUTF8StringEncoding)!
       outStream2?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    func btnOffPressed (){
        let data: NSData = "OFF".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream2?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    func btnAddPressed(){
        let data: NSData = "ADD".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream2?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }
    func btnSubPressed(){
        let data: NSData = "SUB".dataUsingEncoding(NSUTF8StringEncoding)!
        outStream2?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let label = data2{
        labelState.text = data2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

