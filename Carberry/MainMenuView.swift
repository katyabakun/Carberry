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
    lazy var backgraundView = UIImageView()
    lazy var speedLabel1 = UILabel()
    lazy var speedLabel2 = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupViews()
        setupConstraints()
    }
    func setupViews(){
        backgraundView.image = UIImage(named: "Wall-5")
        backgraundView.sizeToFit()
        backgraundView.backgroundColor = UIColor.lightGray
        self.addSubview(backgraundView)
        
        let imageLeft = UIImage(named: "left")
        leftButton.setImage(imageLeft, for: UIControlState())
        leftButton.contentHorizontalAlignment = .fill
        leftButton.contentVerticalAlignment = .fill
        leftButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(leftButton)
        
        rightButton.setImage(UIImage(named: "right"), for: UIControlState())
        rightButton.contentHorizontalAlignment = .fill
        rightButton.contentVerticalAlignment = .fill
        rightButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(rightButton)
        
        speedUpButton.setImage(UIImage(named: "top"), for: UIControlState())
        speedUpButton.contentHorizontalAlignment = .fill
        speedUpButton.contentVerticalAlignment = .fill
        speedUpButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(speedUpButton)
        
        speedDownButton.setImage(UIImage(named: "bottom"), for: UIControlState())
        speedDownButton.contentHorizontalAlignment = .fill
        speedDownButton.contentVerticalAlignment = .fill
        speedDownButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(speedDownButton)
        
        speedLabel1.text = "Speed:"
        self.addSubview(speedLabel1)
        
        self.addSubview(speedLabel2)
    }
    func setupConstraints(){
        constrain(self.leftButton,self.rightButton,self.speedUpButton,self.speedDownButton,self.backgraundView){left_b,right_b,speedup,speeddown,backgraund in
            
            left_b.left == left_b.superview!.left
            left_b.centerY == left_b.superview!.centerY
            left_b.height == left_b.superview!.height/5
            left_b.width == left_b.height
            
            right_b.centerY == left_b.centerY
            right_b.right == right_b.superview!.right
            right_b.size == left_b.size
            
            speedup.bottom == left_b.top
            speedup.centerX == speedup.superview!.centerX
            speedup.size == left_b.size
            
            speeddown.top == left_b.bottom
            speeddown.centerX == speeddown.superview!.centerX
            speeddown.size == left_b.size
            
            backgraund.center == backgraund.superview!.center
            backgraund.size == backgraund.superview!.size
        }
        constrain(speedLabel1,speedLabel2){speed_l1,speed_l2 in
            speed_l1.left == speed_l1.superview!.left + 20
            speed_l1.bottom == speed_l1.superview!.bottom - 60
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
