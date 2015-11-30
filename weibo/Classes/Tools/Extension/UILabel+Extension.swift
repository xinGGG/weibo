//
//  UILabel+Extension.swift
//  weibo
//
//  Created by xing on 15/11/30.
//  Copyright © 2015年 xinGGG. All rights reserved.
//

import UIKit

extension UILabel {

    convenience init(title: String, color: UIColor, fontSize: CGFloat) {
        self.init()
        text = title
        textColor = color
        font = UIFont.systemFontOfSize(fontSize)
        numberOfLines = 0
        
        textAlignment = NSTextAlignment.Center
        
        sizeToFit()
    }
}