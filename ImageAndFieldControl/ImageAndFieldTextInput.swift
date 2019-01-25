//
//  ImageAndFieldTextInput.swift
//  ImageAndFieldControl
//
//  Created by Brent Michalski on 1/25/19.
//  Copyright © 2019 Perlguy, Inc. All rights reserved.
//

import UIKit
import FontAwesome_swift

@IBDesignable
class ImageAndFieldTextInput: ImageAndFieldBase {
    
    @IBOutlet weak var textField: UITextField!
    
    override func setupView() {
        // Note: super.setupView() NOT called here because we don't want the tap gesture recognizer.
        
        imageView.clipsToBounds = true
        placeholderText         = "Placeholder Text"
    }
    
    
    
    // MARK: - IBInspectable's
    @IBInspectable
    public var fontSize: CGFloat = 16 {
        didSet {
            textField.font = textField.font?.withSize(fontSize)
        }
    }
    
    
    @IBInspectable
    public var fontColor: UIColor? {
        didSet {
            textField.textColor = fontColor
        }
    }
    
    
    // Label border
    @IBInspectable
    public var labelBorderColor: UIColor? {
        didSet {
            textField.borderColor = labelBorderColor
        }
    }
    
    @IBInspectable
    public var labelBorderWidth: CGFloat = 0 {
        didSet {
            textField.borderWidth = labelBorderWidth
        }
    }
    
    @IBInspectable
    public var labelBorderCornerRadius: CGFloat = 0 {
        didSet {
            textField.layer.cornerRadius = labelBorderCornerRadius
        }
    }
    
    
    @IBInspectable
    public var placeholderText: String? = nil {
        didSet {
            textField.placeholder = placeholderText
        }
    }
    
    
    
    // MARK: - Interface Builder
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    
    private func initNib() {
        if !self.subviews.isEmpty { return }
        
        let bundle = Bundle(for: ImageAndFieldTextInput.self)
        bundle.loadNibNamed(String(describing: ImageAndFieldTextInput.self), owner: self, options: nil)
        
        self.addSubview(self.containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        
        clipsToBounds = true
    }
}


