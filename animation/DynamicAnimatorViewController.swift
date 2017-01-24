//
//  DynamicAnimatorViewController.swift
//  animation
//
//  Created by NEXTAcademy on 1/23/17.
//  Copyright © 2017 NEXTAcademy. All rights reserved.
//

import UIKit

class DynamicAnimatorViewController: UIViewController {

    var itemButtons = [UIButton]()
    var isMenuOpen : Bool = false
    var btnMain = UIButton()
    
    var dynamicAnimator : UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let btn1 = createButton(title: "Item A", color: .red)
        let btn2 = createButton(title: "Item B", color: .blue)
        let btn3 = createButton(title: "Item C", color: .green)
        let btn4 = createButton(title: "Item D", color: .cyan)
        btnMain = createButton(title: "Menu", color: .magenta)
        
        
        itemButtons.append(btn1)
        itemButtons.append(btn2)
        itemButtons.append(btn3)
        itemButtons.append(btn4)
        
        btnMain.addTarget(self, action: #selector(toogleMenu), for: .touchUpInside)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        }
    
    func toogleMenu() {
        
        dynamicAnimator.removeAllBehaviors()
        if isMenuOpen{
            closeMenu()
        }else{
            openMenu()
        }
        isMenuOpen = !isMenuOpen
    }
    
    func closeMenu(){
        let button = itemButtons[0]
        let snap = UISnapBehavior(item: button, snapTo: btnMain.center)
        dynamicAnimator.addBehavior(snap)
    }
    
    func openMenu(){
        
        let button = itemButtons[0]
        let snap = UISnapBehavior(item: button, snapTo: CGPoint(x: button.center.x + 100, y: button.center.y + 100))
        
        snap.damping = 1.0
        
        dynamicAnimator.addBehavior(snap)
    }
    
    func createButton(title: String, color : UIColor) -> UIButton {
        
        let frame = CGRect(origin: view.center, size: CGSize(width: 100, height: 100))
        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        
        view.addSubview(button)
        
        return button
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
