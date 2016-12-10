//
//  ActionView.swift
//  Carberry
//
//  Created by Katerina Bakun on 18/10/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//
import UIKit
import Cartography

class ActionView: UIView {
    var prostaButton = UIButton()
    var osemkaButton = UIButton()
    var koloButton = UIButton()
    var resetButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColor.middleOrange
        setupSubViews()
        setupConstrain()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSubViews(){
        self.prostaButton.backgroundColor = UIColor.clear
        self.prostaButton.setImage(UIImage(named: "prosta"), for: .normal)
        self.addSubview(prostaButton)
        
        self.koloButton.setImage(UIImage(named: "kolko"), for: .normal)
        self.koloButton.backgroundColor = UIColor.clear
        self.addSubview(koloButton)
        
        self.osemkaButton.setImage(UIImage(named: "osemka"), for: .normal)
        self.osemkaButton.backgroundColor = UIColor.clear
        self.addSubview(osemkaButton)
        
        self.resetButton.setImage(UIImage(named: "reset"), for: .normal)
        self.resetButton.backgroundColor = UIColor.clear
        self.addSubview(resetButton)
    }
    func setupConstrain(){
        constrain(prostaButton, koloButton, osemkaButton, resetButton) { prosta, kolo, osemka, reset in
            guard let superview = prosta.superview else{
                return
            }
            
            prosta.top == superview.top + 130
            prosta.left == superview.left + 20
            
            kolo.top == prosta.top
            kolo.right == superview.right - 20
            
            osemka.bottom == superview.bottom - 100
            osemka.left == prosta.left
            
            reset.right == kolo.right
            reset.bottom == osemka.bottom
            
            prosta.width == superview.width/2.5
            prosta.height == prosta.width
            
            kolo.size == prosta.size
            osemka.size == prosta.size
            reset.size == prosta.size
        }
    }
    override func layoutSubviews() {
        let radius = 10.0
        self.prostaButton.roundCorners(corners: [.allCorners], radius: CGFloat(radius))
        self.prostaButton.layer.borderWidth = 3
        self.prostaButton.layer.borderColor = UIColor.black.cgColor
        
        self.koloButton.roundCorners(corners: [.allCorners], radius: CGFloat(radius))
        self.koloButton.layer.borderWidth = 3
        self.koloButton.layer.borderColor = UIColor.black.cgColor
        
        self.osemkaButton.roundCorners(corners: [.allCorners], radius: CGFloat(radius))
        self.osemkaButton.layer.borderWidth = 3
        self.osemkaButton.layer.borderColor = UIColor.black.cgColor
        
        self.resetButton.roundCorners(corners: [.allCorners], radius: CGFloat(radius))
        self.resetButton.layer.borderWidth = 3
        self.resetButton.layer.borderColor = UIColor.black.cgColor
    
    }

}
