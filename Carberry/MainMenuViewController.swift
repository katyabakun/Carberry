//
//  MainMenuViewController.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

class MainMenuViewController:BaseViewController<MainMenuView>,UINavigationBarDelegate,UIPopoverPresentationControllerDelegate{
    override init() {
        super.init()
        
        let tabBarItem1 = UITabBarItem(title: "", image: UIImage(named: "main"), tag: 1)
            tabBarItem1.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        self.tabBarController?.tabBar.clipsToBounds = true
        
        self.tabBarItem = tabBarItem1        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBarItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: #selector(openConnectionVC(_:)))
        
        self.navigationItem.rightBarButtonItem = rightBarItem
        self.navigationController?.navigationBar.topItem?.title = "Main menu"
       // self.navigationController?.pushViewController(ActionViewController(), animated: true)
      
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        // Create the navigation bar
        self.navigationController?.navigationBar.hidden = false
        self.tabBarController?.tabBar.hidden = false
    }
    func openConnectionVC(sender: UIBarButtonItem){
        let x = UIScreen.mainScreen().bounds.width
        let y = UIScreen.mainScreen().bounds.height
        let conVC = ConnectionViewController()
        conVC.modalTransitionStyle = .CoverVertical
        conVC.modalPresentationStyle = .Popover
        conVC.preferredContentSize = CGSize(width: x - 20, height: y/2)
        let popover:UIPopoverPresentationController = conVC.popoverPresentationController!
        popover.permittedArrowDirections = .Up
        popover.sourceView = view
        popover.sourceRect = CGRect(origin: CGPoint(x: 0,y: 50), size: CGSize(width: view.bounds.width,height: 30))
        popover.delegate = self
        self.presentViewController(conVC, animated: true, completion: nil)
        
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let btnDone = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(MainMenuViewController.dismiss))
        navigationController.topViewController!.navigationItem.rightBarButtonItem = btnDone
        return navigationController
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
