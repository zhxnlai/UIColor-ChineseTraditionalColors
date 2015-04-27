//
//  CTCCollectionViewCell.swift
//  ChineseTraditionalColors
//
//  Created by Zhixuan Lai on 4/27/15.
//  Copyright (c) 2015 Zhixuan Lai. All rights reserved.
//

import UIKit

class CTCCollectionViewCell: UICollectionViewCell {
    var color: UIColor? {
        didSet {
            if let color = color {
                contentView.backgroundColor = color
            }
        }
    }
    
    var attributedText: NSAttributedString? {
        didSet {
            if let attributedText = attributedText {
                label.attributedText = attributedText
            }
        }
    }
    
    private var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        contentView.addSubview(label)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let labelInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        label.frame = UIEdgeInsetsInsetRect(bounds, labelInset)
    }

}
