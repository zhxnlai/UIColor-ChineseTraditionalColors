//
//  ViewController.swift
//  ChineseTraditionalColors
//
//  Created by Zhixuan Lai on 11/2/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit
import performSelector_swift
import SwiftyJSON

class CTCCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var colors: [JSON]?
    private let cellIdentifier = "cell"

    override func loadView() {
        super.loadView()
        if let colorsPath = NSBundle.mainBundle().pathForResource("colors", ofType: "json"), colorsData = NSData(contentsOfFile: colorsPath) {
            // source: http://ylbook.com/cms/web/chuantongsecai/chuantongsecai.htm
            colors = JSON(data: colorsData).array
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UIColor+ChineseTraditionalColors"
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        collectionView?.backgroundColor = UIColor.粉红()
        collectionView?.registerClass(CTCCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let numColors = colors?.count {
            return numColors
        }
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! CTCCollectionViewCell
        if let (attributedText, color) = stringColorForIndexPath(indexPath) {
            cell.color = color
            cell.attributedText = attributedText
        }
        return cell
    }
    
    // MARK: - ()
    var cache = [Int: (NSAttributedString, UIColor)]()

    func stringColorForIndexPath(indexPath: NSIndexPath) -> (NSAttributedString, UIColor)? {
        if let cached = cache[indexPath.item] {
            return cached
        } else if let color = colors?[indexPath.item], name = color["name"].string, desc = color["desc"].string, uiColor = UIColor.swift_performSelector(Selector(name), withObject: nil) as? UIColor {
            let foregroundColor = readableForegroundColorForBackgroundColor(uiColor)
            
            var attrs = [NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 19)!,
                        NSForegroundColorAttributeName: foregroundColor]
            var attrsSub = [NSFontAttributeName : UIFont(name: "HelveticaNeue-Light", size: 14)!,
                            NSForegroundColorAttributeName: foregroundColor.colorWithAlphaComponent(0.8)]
            var attributedString = NSMutableAttributedString(string: name+"\n", attributes: attrs)
            attributedString.appendAttributedString(NSAttributedString(string: desc, attributes: attrsSub))
            cache[indexPath.item] = (attributedString, uiColor)
            return (attributedString, uiColor)
        }

        return nil
    }
    
    // http://stackoverflow.com/questions/2509443/check-if-uicolor-is-dark-or-bright
    func readableForegroundColorForBackgroundColor(backgroundColor: UIColor) -> UIColor {
        let componentColors = CGColorGetComponents(backgroundColor.CGColor)
        let r = ((componentColors[0]*255) * 299)
        let g = ((componentColors[1]*255) * 587)
        let b = ((componentColors[2]*255) * 114)
        let darknessScore = (r + g + b) / 1000;
        
        if darknessScore >= 125 {
            return UIColor.blackColor()
        }
        
        return UIColor.whiteColor()
    }
}

