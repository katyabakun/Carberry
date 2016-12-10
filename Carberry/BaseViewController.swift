//
//  BaseViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

class BaseViewController<TView: UIView> : UIViewController {

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        

        print("init in BaseViewController -> \(type(of: self))")
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var aView: TView {
        return self.view as! TView
    }
    
    override func loadView() {
        let view = TView(frame: UIScreen.main.bounds)
        
        self.view = view
    }
    
    //MARK: deinit
    deinit {
        
        print("deinit in BaseViewController -> \(type(of: self))")
    }
    
}
