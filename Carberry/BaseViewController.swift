//
//  BaseViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

protocol DisplayPreferable {
    var requiresNavBarHidden: Bool { get }
}

class BaseViewController<TView: UIView> : UIViewController, DisplayPreferable {
    //    let lifeTimeDisposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        //        let view = TView(frame: UIScreen.mainScreen().bounds)
        //
        //        self.view = view
        print("init in BaseViewController -> \(type(of: self))")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    var aView: TView {
        return self.view as! TView
    }
    
    override func loadView() {
        let view = TView(frame: UIScreen.main.bounds)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: deinit
    deinit {
        print("deinit in BaseViewController -> \(type(of: self))")
    }
    
    // MARK: -  DisplayPreferable
    
    var requiresNavBarHidden: Bool {
        get {
            return false
        }
    }
    
}
