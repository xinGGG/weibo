//
//  Extension.swift
//  weibo
//
//  Created by Dragonpass on 15/11/30.
//  Copyright © 2015年 xinGGG. All rights reserved.
//

import UIKit

extension UIButton{
    
    /// 便利构造函数
    ///
    /// - parameter imageName:     imageName
    /// - parameter backImageName: 背景图像名称
    ///
    /// - returns: UIButton
    convenience init(imageName:String,backImageName:String){
        
        // 实例化按钮
        self.init()
        
        // 设置按钮属性
        setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        setBackgroundImage(UIImage(named: backImageName), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: backImageName + "_highlighted"), forState: UIControlState.Highlighted)
        
        // 自动调整大小
        sizeToFit()
    }
    
    
    /// 便利构造函数
    ///
    /// - parameter title:         title
    /// - parameter fontSize:      fontSize
    /// - parameter color:         color
    /// - parameter backImageName: backImageName
    ///
    /// - returns: UIButton
    convenience init(title: String, fontSize: CGFloat, color: UIColor, backImageName: String) {
        
        self.init()
        
        setTitle(title, forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: backImageName), forState: UIControlState.Normal)
        setTitleColor(color, forState: UIControlState.Normal)
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }
}