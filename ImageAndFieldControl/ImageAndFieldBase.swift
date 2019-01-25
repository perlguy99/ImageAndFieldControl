//
//  ImageAndFieldBase.swift
//  ImageAndFieldControl
//
//  Created by Brent Michalski on 1/25/19.
//  Copyright © 2019 Perlguy, Inc. All rights reserved.
//

import UIKit
import FontAwesome_swift

@IBDesignable
public class ImageAndFieldBase: UIView {
    
    var defaultImageSize: CGFloat = 30.0
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint! {
        didSet {
            imageView.size = CGSize(width: imageViewHeightConstraint.constant, height: imageViewHeightConstraint.constant)
        }
    }
    
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    
    
    @IBInspectable
    public var image: UIImage? {
        didSet {
            if let image = image {
                imageViewLeadingConstraint.constant = 8.0
                imageView.image                     = image
            }
            else {
                imageViewHeightConstraint.constant  = 0
                imageViewLeadingConstraint.constant = 0
            }
        }
    }
    
    
    public func setFAImage(image: FontAwesome, style: FontAwesomeStyle? = nil, color: UIColor? = nil, size: CGFloat? = nil) {
        var imageSize = CGSize.zero
        
        if let size = size {
            imageSize = CGSize(width: size, height: size)
            imageHeight = size
        }
        else {
            imageSize = CGSize(width: defaultImageSize, height: defaultImageSize)
            imageHeight = defaultImageSize
        }
        
        imageView.image = UIImage.fontAwesomeIcon(name: image, style: style ?? .regular, textColor: color ?? .black, size: imageSize)
    }
    
    
    // MARK: - Setup The View
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tap.numberOfTapsRequired = 1
        self.containerView.addGestureRecognizer(tap)

        imageView.clipsToBounds = true
    }
    
    
    @objc func viewTapped(_ sender: Any) { }
  
    
    @IBInspectable
    public var bgColor: UIColor = .white {
        didSet {
            containerView.backgroundColor = bgColor
        }
    }
    
    
    // Outer border
    @IBInspectable
    public var outerBorder: UIColor? {
        didSet {
            containerView.borderColor = outerBorder
        }
    }
    
    @IBInspectable
    public var outerBorderWidth: CGFloat = 0 {
        didSet {
            containerView.borderWidth = outerBorderWidth
        }
    }
    
    @IBInspectable
    public var outerBorderCornerRadius: CGFloat = 0 {
        didSet {
            containerView.layer.cornerRadius = outerBorderCornerRadius
        }
    }
    
    
    // ImageView settings
    @IBInspectable
    public var imageBackgroundColor: UIColor? = .clear {
        didSet {
            imageView.backgroundColor = imageBackgroundColor
        }
    }

    
    @IBInspectable
    public var imageBorderColor: UIColor? {
        didSet {
            imageView.borderColor = imageBorderColor
        }
    }
    
    @IBInspectable
    public var imageBorderWidth: CGFloat = 0 {
        didSet {
            imageView.borderWidth = imageBorderWidth
        }
    }
    
    @IBInspectable
    public var imageBorderCornerRadius: CGFloat = 0 {
        didSet {
            imageView.layer.cornerRadius = imageBorderCornerRadius
        }
    }
    
    @IBInspectable
    public var imageHeight: CGFloat = 40 {
        didSet {
            imageView.size = CGSize(width: imageHeight, height: imageHeight)
            imageViewHeightConstraint.constant = imageHeight
        }
    }
    
    
    // MARK: - Interface Builder
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    
}
