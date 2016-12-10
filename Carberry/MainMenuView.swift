//
//  File.swift
//  Carberry
//
//  Created by Katerina Bakun on 16/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//
import UIKit
import Cartography

class MainMenuView: UIView {
    lazy var leftButton = UIButton()
    lazy var rightButton = UIButton()
    lazy var speedUpButton = UIButton()
    lazy var speedDownButton = UIButton()
    
    var speedView = Speedometer() 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    func setupViews(){
        
        self.backgroundColor = AppColor.orangeDark
        
        self.addSubview(self.speedView)
        
        let imageLeft = UIImage(named: "left-arrow")
        leftButton.setImage(imageLeft, for: UIControlState())
        leftButton.setContentMode(button: leftButton)
        leftButton.tintColor = AppColor.darkGrey
        self.addSubview(leftButton)
        
        rightButton.setImage(UIImage(named: "right-arrow"), for: UIControlState())
        rightButton.setContentMode(button: rightButton)
        rightButton.tintColor  = AppColor.darkGrey
        self.addSubview(rightButton)
        
        speedUpButton.setImage(UIImage(named: "plus"), for: UIControlState())
        speedUpButton.setContentMode(button: speedUpButton)
        speedUpButton.tintColor = AppColor.darkGrey
        self.addSubview(speedUpButton)
        
        speedDownButton.setImage(UIImage(named: "minus"), for: UIControlState())
        speedDownButton.setContentMode(button: speedDownButton)
        speedDownButton.tintColor = AppColor.darkGrey
        self.addSubview(speedDownButton)
        
        
    }
    func setupConstraints(){
        constrain(self.leftButton,self.rightButton,self.speedUpButton,self.speedDownButton,self.speedView){left_b,right_b,speedup,speeddown,speedV in
            
            left_b.left == left_b.superview!.left
            left_b.centerY == left_b.superview!.centerY + 110
            left_b.height == left_b.superview!.height/5
            left_b.width == left_b.height
            
            right_b.centerY == left_b.centerY
            right_b.right == right_b.superview!.right
            right_b.size == left_b.size
            
            speedup.centerY == speedup.superview!.centerY - 110
            speedup.right == speedup.superview!.right
            speedup.size == left_b.size
            
            speeddown.centerY == speedup.centerY
            speeddown.left == speeddown.superview!.left
            speeddown.size == left_b.size
            
            speedV.centerY == speedV.superview!.centerY
            speedV.centerX == speedV.superview!.centerX
            speedV.width == speedV.superview!.width/3.2
            speedV.height == speedV.width
            
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
