//
//  File.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
import Cartography

class ConnectionView: UIView {
    lazy var testbuton = UIButton()
    lazy var connectionStateLabel = UILabel()
    lazy var connectionButton = UIButton()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = AppColor.appOrange
        self.setupViews()
        self.setupConstrains()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        
        
        connectionStateLabel.text = "TO CONNECT TO SERVER PLEASE PRESS THE BUTTON ABOVE"
        connectionStateLabel.sizeToFit()
        connectionStateLabel.lineBreakMode = .byWordWrapping
        connectionStateLabel.numberOfLines = 3
        connectionStateLabel.font = UIFont.systemFont(ofSize: 19.0)
        connectionStateLabel.textColor = AppColor.appGrey
        connectionStateLabel.textAlignment = .center
        self.addSubview(connectionStateLabel)
        
        
        self.connectionButton.setImage(UIImage(named: "wifi"), for: .normal)
        connectionButton.setContentMode(button: self.connectionButton)
        connectionButton.tintColor = AppColor.appLightGray
        self.addSubview(connectionButton)
        testbuton.backgroundColor = AppColor.appGrey
        self.addSubview(testbuton)
    }
    func setupConstrains(){
        let width = UIScreen.main.bounds.width/1.5
        
        constrain(self.connectionStateLabel,self.connectionButton){connection,c_button in
            guard let superview = c_button.superview else{
                return
            }
            c_button.centerX == superview.centerX
            c_button.centerY == superview.centerY - 20
            c_button.width == width
            c_button.height == width
            
            connection.centerX == c_button.centerX
            connection.top == c_button.bottom + 30
            connection.width == superview.width - 40
        }
        constrain(testbuton){test in
            guard let superview = test.superview else{
                return
            }
            test.centerX == superview.centerX
            test.top == superview.top
            test.size == superview.size/6
        }
    }
}
