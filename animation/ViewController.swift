//
//  ViewController.swift
//  animation
//
//  Created by NEXTAcademy on 1/23/17.
//  Copyright © 2017 NEXTAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView : UIImageView = UIImageView()
    var cardImageView = UIImageView()
    var roundedButton = RoundedButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var frame = CGRect(x: -100, y: 100, width: 200, height: 200)
        imageView = UIImageView(frame: frame)
        imageView.image = #imageLiteral(resourceName: "head2")
        
        frame = CGRect(x: 100, y: view.frame.height - 100 , width: 100 , height: 100)
        cardImageView = UIImageView(frame: frame)
        cardImageView.image = #imageLiteral(resourceName: "head3")
        
        cardImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        cardImageView.addGestureRecognizer(tap)
        
        view.addSubview(imageView)
        view.addSubview(cardImageView)
        
        let size = CGSize(width: 40, height: 40)
        let btnFrame = CGRect(origin: CGPoint.zero, size: size)
        roundedButton = RoundedButton(frame: btnFrame)
        roundedButton.center = view.center
        roundedButton.backgroundColor = UIColor.red
        view.addSubview(roundedButton)
        
    }
    
    func handleTap(_ sender : UITapGestureRecognizer){
        UIView.transition(with: cardImageView, duration: 3.0, options: .transitionFlipFromLeft, animations: {
            self.cardImageView.image = #imageLiteral(resourceName: "head4")
        }, completion: {(finished) in
            self.cardImageView.removeFromSuperview()
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.repeat , .autoreverse] , animations: {
            let frame = CGRect(x: self.view.frame.width + 100, y: self.imageView.frame.minY, width: self.imageView.frame.width , height: self.imageView.frame.height )
            self.imageView.frame = frame
        }, completion: nil)
        
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat , .autoreverse] , animations: {
            self.roundedButton.transform = CGAffineTransform(scaleX: 3, y: 3)
        }, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



/*
 core animation
 
 assets

 //cloud
 //move frame, move center
 
 //multiple option
 
 //transition , flip card
 //completion , dismiss
 
 //rounded button class
 
 
 what is layer
 super.draw(rect)
 ibdesignable
*/
