//
//  ButtonsStyle.swift
//  Tinder
//
//  Created by Андрей Коноплев on 08.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setStyle()
    }
    
    private func setStyle() {
        layer.cornerRadius = 30
        layer.borderWidth = 1
        layer.borderColor = UIColor.green.cgColor
        backgroundColor = UIColor.green
        setTitleColor(UIColor.white, for: UIControlState.normal)
    }
}

class DislikeButton: UIButton {
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setStyle()
    }
    
    private func setStyle() {
        layer.cornerRadius = 30
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        backgroundColor = UIColor.red
        setTitleColor(UIColor.white, for: UIControlState.normal)
    }
}
