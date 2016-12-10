//
//  SettingsView.swift
//  Carberry
//
//  Created by Katerina Bakun on 20/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
import Cartography

class SettingsView: UIView{
    let xLabel = UILabel()
    let yLabel = UILabel()
    let zLabel = UILabel()
    
    let x = UILabel()
    let y = UILabel()
    let z = UILabel()
    
    let plusLabel = UIButton()
    let minusLabel = UIButton()
    let leftLabel = UIButton()
    let rightLabel = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red:0.86, green:0.40, blue:0.18, alpha:1.0)
        setupViews()
        setupContrain()
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        
        plusLabel.backgroundColor = UIColor.white
        plusLabel.setContentMode(button: self.plusLabel)
        self.plusLabel.tintColor = AppColor.darkGrey
        plusLabel.setImage(UIImage(named: "plus"), for: .normal)
        
        self.addSubview(plusLabel)
        minusLabel.setContentMode(button: self.minusLabel)
        self.minusLabel.tintColor = AppColor.darkGrey
        minusLabel.setImage(UIImage(named: "minus"), for: .normal)
        minusLabel.backgroundColor = UIColor.white

        self.addSubview(minusLabel)
        
        leftLabel.backgroundColor = UIColor.white
        leftLabel.setContentMode(button: self.leftLabel)
        self.leftLabel.tintColor = AppColor.darkGrey
        leftLabel.setImage(UIImage(named: "left-arrow"), for: .normal)
        self.addSubview(leftLabel)
        
        rightLabel.backgroundColor = UIColor.white
        self.rightLabel.tintColor = AppColor.darkGrey
        rightLabel.setContentMode(button: self.rightLabel)
        rightLabel.setImage(UIImage(named: "right-arrow"), for: .normal)
        self.addSubview(rightLabel)
        

        xLabel.backgroundColor =  UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 0.65)
        xLabel.font = UIFont.systemFont(ofSize: 30.0)
        xLabel.textAlignment = .center
        xLabel.textColor = AppColor.appOrange
        xLabel.sizeToFit()
        self.addSubview(xLabel)
        
        yLabel.backgroundColor =  UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 0.65)
        yLabel.font = UIFont.systemFont(ofSize: 30.0)
        yLabel.textAlignment = .center
        yLabel.textColor = AppColor.appOrange
        yLabel.sizeToFit()
        
        zLabel.backgroundColor =  UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 0.65)
        zLabel.font = UIFont.systemFont(ofSize: 30.0)
        zLabel.textAlignment = .center
        zLabel.textColor = AppColor.appOrange
        zLabel.sizeToFit()
        self.addSubview(yLabel)
        self.addSubview(zLabel)
        
        self.addSubview(x)
        x.textColor = AppColor.darkGrey
        x.text = "x:"
        x.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(y)
        y.textColor = AppColor.darkGrey
        y.text = "y:"
        y.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(z)
        z.textColor = AppColor.darkGrey
        z.text = "z:"
        z.font = UIFont.boldSystemFont(ofSize: 14)
        
        
    }
    func setupContrain()  {
        constrain(xLabel,yLabel,zLabel){x,y,z in
            x.top == x.superview!.top + 80
            x.centerX == x.superview!.centerX
            x.width == x.superview!.width/3
            
            y.top == x.bottom + 20
            y.centerX == x.centerX
            y.width == x.width
            
            z.top == y.bottom + 20
            z.centerX == y.centerX
            z.width == y.width
        }

        constrain(minusLabel,plusLabel,leftLabel,rightLabel){ minusL,plusL,leftL,rightL in
            
            guard let superview = minusL.superview else {
                return
            }
            minusL.top == superview.top + 40
            minusL.left == minusL.superview!.left + 30
            minusL.height == superview.height/3
            minusL.width == minusL.height
            
            plusL.top == minusL.top
            plusL.right == superview.right - 30
            plusL.size == minusL.size
            
            leftL.top == minusL.bottom + 20
            leftL.left == minusL.left
            leftL.size == minusL.size
            
            rightL.top == minusL.bottom + 10
            rightL.right == plusL.right
            rightL.size == minusL.size
            
        }
        constrain(x,y,yLabel,xLabel){x,y,yl,xl in
            x.bottom == xl.top
            x.centerX == xl.centerX
            x.width == 20
            
            y.bottom == yl.top
            y.centerX == yl.centerX
            y.width == 20
        }
        constrain(z,zLabel){z,zl in
        
            z.bottom == zl.top
            z.centerX == zl.centerX
            z.width == 20
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.minusLabel.layer.cornerRadius = 10
        self.minusLabel.layer.borderColor = AppColor.darkGrey.cgColor
        self.minusLabel.layer.borderWidth = 3
        
        self.plusLabel.layer.cornerRadius = 10
        self.plusLabel.layer.borderColor = AppColor.darkGrey.cgColor
        self.plusLabel.layer.borderWidth = 3
        
        self.leftLabel.layer.cornerRadius = 10
        self.leftLabel.layer.borderColor = AppColor.darkGrey.cgColor
        self.leftLabel.layer.borderWidth = 3
        
        self.rightLabel.layer.cornerRadius = 10
        self.rightLabel.layer.borderColor = AppColor.darkGrey.cgColor
        self.rightLabel.layer.borderWidth = 3
        
    }
    
}
