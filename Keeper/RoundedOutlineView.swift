//
//  RoundedOutlineButton.swift
//  Keeper
//
//  Created by sakuke on 1/2/17.
//  Copyright © 2017 Quang. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedOutlineView: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            setupView()
        }
    }
    @IBInspectable var borderWith: CGFloat = 0.0 {
        didSet {
            setupView()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWith
        layer.borderColor = borderColor?.cgColor
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }

}
