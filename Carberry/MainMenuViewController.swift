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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBarItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(openConnectionVC(_:)))
        
        self.navigationItem.rightBarButtonItem = rightBarItem
        self.navigationController?.navigationBar.topItem?.title = "Main menu"
       // self.navigationController?.pushViewController(ActionViewController(), animated: true)
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Create the navigation bar
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    func openConnectionVC(_ sender: UIBarButtonItem){
        let x = UIScreen.main.bounds.width
        let y = UIScreen.main.bounds.height
        let conVC = ConnectionViewController()
        conVC.modalTransitionStyle = .coverVertical
        conVC.modalPresentationStyle = .popover
        conVC.preferredContentSize = CGSize(width: x - 20, height: y/2)
        let popover:UIPopoverPresentationController = conVC.popoverPresentationController!
        popover.permittedArrowDirections = .up
        popover.sourceView = view
        popover.sourceRect = CGRect(origin: CGPoint(x: 0,y: 50), size: CGSize(width: view.bounds.width,height: 30))
        popover.delegate = self
        self.present(conVC, animated: true, completion: nil)
        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(MainMenuViewController.dismiss))
        navigationController.topViewController!.navigationItem.rightBarButtonItem = btnDone
        return navigationController
    }


}
