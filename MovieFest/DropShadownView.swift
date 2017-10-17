//
//  DropShadownView.swift
//  MovieFest
//
//  Created by Marcus Reuber Almeida Moraes Silva on 10/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import UIKit


@IBDesignable

class DropShadownView: UIView {

    @IBInspectable var shadowOffset :  CGSize = CGSize(width: 0.0, height: 0.0)
    
    @IBInspectable var shadowOpacity : Float = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
 
    
    func setup(){
        layer.shadowOffset = shadowOffset
        
        layer.shadowOpacity = shadowOpacity
    }
}
