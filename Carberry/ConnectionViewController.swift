//
//  ConnectionViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

class ConnectionViewController: BaseViewController<ConnectionView> ,UIPopoverPresentationControllerDelegate{
    
    override init(){
    super.init()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aView.connectionSwitch.addTarget(self, action: #selector(stateChanged), forControlEvents: UIControlEvents.ValueChanged)

}
    func stateChanged(switchState: UISwitch){
        if switchState.on {
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }

    
}
