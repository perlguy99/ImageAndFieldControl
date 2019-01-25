//
//  ImageAndFieldDate.swift
//  ImageAndFieldControl
//
//  Created by Brent Michalski on 1/25/19.
//  Copyright © 2019 Perlguy, Inc. All rights reserved.
//

import UIKit
import DateToolsSwift

@IBDesignable
public class ImageAndFieldDate: ImageAndFieldBase {
    
    @IBOutlet weak var pickerLabel: PaddedLabel!
    
    
    override func setupView() {
        super.setupView()
        
        placeholderText = "Placeholder Text"
    }
    
    
     @objc override func viewTapped(_ sender: Any) {
        let minDate = minDateYears.years.earlier
        let maxDate = maxDateYears.years.later
        let nowDate = Date()
        
        let alert = UIAlertController(style: .actionSheet, title: "Select date")
        
        alert.addDatePicker(mode: .dateAndTime, date: nowDate, minimumDate: minDate, maximumDate: maxDate) { date in
            // action with selected date
            print("\nDATE SELECTED: \(date)\n")
            
            self.setText(text: date.dateTimeString())
        }
        
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    
    public var currentValue: String? {
        return pickerLabel.text
    }
    
    public func setText(text: String) {
        pickerLabel.textColor = fontColor?.withAlphaComponent(1)
        pickerLabel.text = text
    }
    
    
    // MARK: - IBInspectable's
    @IBInspectable
    public var minDateYears: Int = 1
    
    @IBInspectable
    public var maxDateYears: Int = 1
    
    @IBInspectable
    public var placeholderText: String? {
        didSet {
            pickerLabel.textColor = fontColor?.withAlphaComponent(0.6)
            pickerLabel.text      = placeholderText
        }
    }
    
    @IBInspectable
    public var fontSize: CGFloat = 16 {
        didSet {
            pickerLabel.font = pickerLabel.font.withSize(fontSize)
        }
    }


    @IBInspectable
    public var fontColor: UIColor? {
        didSet {
            pickerLabel.textColor = fontColor
        }
    }
    
    
    // Label border
    @IBInspectable
    public var labelBorderColor: UIColor? {
        didSet {
            pickerLabel.borderColor = labelBorderColor
        }
    }

    @IBInspectable
    public var labelBorderWidth: CGFloat = 0 {
        didSet {
            pickerLabel.borderWidth = labelBorderWidth
        }
    }

    @IBInspectable
    public var labelBorderCornerRadius: CGFloat = 0 {
        didSet {
            pickerLabel.layer.cornerRadius = labelBorderCornerRadius
        }
    }
    
    
    // MARK: - Interface Builder
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    
    // MARK: - Methods to make the control load properly.
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
        
        let bundle = Bundle(for: ImageAndFieldDate.self)
        bundle.loadNibNamed(String(describing: ImageAndFieldDate.self), owner: self, options: nil)
        
        self.addSubview(self.containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        
        setupView()
        
        clipsToBounds = true
    }
}
