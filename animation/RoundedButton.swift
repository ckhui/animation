//
//  RoundedButton.swift
//  animation
//
//  Created by NEXTAcademy on 1/23/17.
//  Copyright © 2017 NEXTAcademy. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = rect.size.width / 2
        
    }
 

}
