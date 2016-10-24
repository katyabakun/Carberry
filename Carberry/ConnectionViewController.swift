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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aView.connectionSwitch.addTarget(self, action: #selector(stateChanged), for: UIControlEvents.valueChanged)

}
    func stateChanged(_ switchState: UISwitch){
        if switchState.isOn {
            self.dismiss(animated: true, completion: nil)
            
        }
    }

    
}
