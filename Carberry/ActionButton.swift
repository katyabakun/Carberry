//
//  ActionButton.swift
//  Carberry
//
//  Created by Katerina Bakun on 07/12/2016.
//  Copyright © 2016 Katerina Bakunkaterinabakun. All rights reserved.
//

import UIKit

class ActionButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        let radius = 10.0
        self.roundCorners(corners: [.allCorners], radius: CGFloat(radius))
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.black.cgColor
    }
}
