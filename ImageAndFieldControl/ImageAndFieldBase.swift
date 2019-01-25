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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
//    @IBOutlet weak var pickerLabel: PaddedLabel!

    
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
    
    
    @IBInspectable public var FA_imageName: String? {
        didSet {
            guard let FA_imageName = FA_imageName else { return }
            if let faImage = FontAwesome(rawValue: FA_imageName) {
                imageView.image = UIImage.fontAwesomeIcon(name: faImage, style: FontAwesomeStyle.regular, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
            }
        }
    }
    
    
    // MARK: - Setup The View
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tap.numberOfTapsRequired = 1
        self.containerView.addGestureRecognizer(tap)

        imageView.clipsToBounds = true
    }
    
    
    @objc func viewTapped(_ sender: Any) {
    }
    
    
//    public var currentValue: String? {
//        return pickerLabel.text
//    }
    
//    public func setText(text: String) {
//        pickerLabel.textColor = fontColor?.withAlphaComponent(1)
//        pickerLabel.text = text
//    }
    
    
    @IBInspectable
    public var bgColor: UIColor = .white {
        didSet {
            containerView.backgroundColor = bgColor
        }
    }
    
    
//    @IBInspectable
//    public var placeholderText: String? {
//        didSet {
//            pickerLabel.textColor = fontColor?.withAlphaComponent(0.6)
//            pickerLabel.text      = placeholderText
//        }
//    }
    
    
//    @IBInspectable
//    public var fontSize: CGFloat = 16 {
//        didSet {
//            pickerLabel.font = pickerLabel.font.withSize(fontSize)
//        }
//    }
    
    
//    @IBInspectable
//    public var fontColor: UIColor? {
//        didSet {
//            pickerLabel.textColor = fontColor
//        }
//    }
    
    
    
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
    
    
    // Label border
//    @IBInspectable
//    public var labelBorderColor: UIColor? {
//        didSet {
//            pickerLabel.borderColor = labelBorderColor
//        }
//    }
    
//    @IBInspectable
//    public var labelBorderWidth: CGFloat = 0 {
//        didSet {
//            pickerLabel.borderWidth = labelBorderWidth
//        }
//    }
    
//    @IBInspectable
//    public var labelBorderCornerRadius: CGFloat = 0 {
//        didSet {
//            pickerLabel.layer.cornerRadius = labelBorderCornerRadius
//        }
//    }
    
    
    
    // MARK: - Interface Builder
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    
}
