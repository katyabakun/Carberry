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
    lazy var labelTop = UILabel()
    lazy var connectionStateLabel = UILabel()
    lazy var connectionSwitch = UISwitch()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
        self.setupViews()
        self.setupConstrains()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        
        labelTop.text = "Coonect to server"
        labelTop.textColor = UIColor.black
        self.addSubview(labelTop)
        
        connectionStateLabel.text = "PLEASE CONNECT TO SERVER"
        connectionStateLabel.font = UIFont.systemFont(ofSize: 21.0)
        connectionStateLabel.textColor = UIColor.black
        self.addSubview(connectionStateLabel)
        
        connectionSwitch.onTintColor = UIColor.cyan
        self.addSubview(connectionSwitch)
    }
    func setupConstrains(){
        
        constrain(self.labelTop,self.connectionStateLabel,self.connectionSwitch){labeltop,connection,c_switch in
            labeltop.centerX == labeltop.superview!.centerX
            labeltop.top == labeltop.superview!.top + 180
            
            connection.top == labeltop.bottom + 140
            connection.centerX == labeltop.centerX
            
            c_switch.top == connection.bottom+50
            c_switch.centerX == connection.centerX
        }
    }
}
