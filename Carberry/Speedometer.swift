//
//  Speedometer.swift
//  Carberry
//
//  Created by Katerina Bakun on 07/12/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit
import Cartography

class Speedometer: UIView {

    var speed = UILabel()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        self.backgroundColor = AppColor.speedLightGray
        
        self.speed.text = "122"
        self.speed.textColor = AppColor.appOrange
        self.speed.font = UIFont.boldSystemFont(ofSize: 30.0)
        
        self.speed.sizeToFit()
        self.speed.textAlignment = .center
        self.addSubview(self.speed)
    }
    func setupConstraint(){
        constrain(self.speed){speed in
            guard let superview = speed.superview else{
                return
            }
            speed.center == superview.center
            speed.width == superview.width - 10
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        //self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 30
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        
        let radius = self.bounds.width/2
        self.roundCorners(corners: [.allCorners], radius: radius)

    }
}
