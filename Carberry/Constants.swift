//
//  Constants.swift
//  Carberry
//
//  Created by Katerina Bakun on 18/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
struct AppColor{
    static let appOrange = UIColor(red: 1.0, green: 0.42, blue: 0, alpha: 1.0)
    static let appGrey = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    static let appLightGray = UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 1.0)
    static let speedLightGray = UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 0.5)
    static let darkGrey = UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 0.9)
    static let orangeDark = UIColor(red:0.92, green:0.34, blue:0.20, alpha:1.0)
    static let middleOrange = UIColor(red:0.97, green:0.54, blue:0.15, alpha:1.0)
}
struct ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

struct ipAdress{
    static let addr = "192.168.1.1"
    static let port = 9943
    
}

extension UIButton {
    
    func setContentMode(button: UIButton){
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
    }
}
extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
