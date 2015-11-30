//
//  VisitorView.swift
//  weibo
//
//  Created by xing on 15/11/30.
//  Copyright © 2015年 xinGGG. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    func setupInfo(imageName: String?, title: String) {
        
        messageLabel.text = title
        
        // 判断是否指定了图像，不是首页
        if imageName != nil {
            iconView.image = UIImage(named: imageName!)
            homeIconView.hidden = true
            sendSubviewToBack(maskIconView)
        } else {    // 如果是首页，播放动画
            startAnim()
        }
    }
    
    /// 开始动画
    private func startAnim() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        
        // 通常应用在循环播放的动画，动画会绑定在图层上，不会被销毁
        // 提示：当视图被销毁时，动画会一起被销毁，不需要考虑额外的操作
        anim.removedOnCompletion = false
        
        iconView.layer.addAnimation(anim, forKey: nil)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(){
        // 1. 添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 2. 设置布局 - 约束需要添加到父视图上
        // 默认情况下，用纯代码开发支持设置 frame，如果使用自动布局，必须设置此属性
        //        iconView.translatesAutoresizingMaskIntoConstraints = false
        //        homeIconView.translatesAutoresizingMaskIntoConstraints = false
        // 遍历子视图，统一设置 translatesAutoresizingMaskIntoConstraints
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 提示：使用纯代码布局，最好让所有的控件，顺序参照某一个控件
        // 1> 图标
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: -60))
        // 2> 小房子
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .CenterX, relatedBy: .Equal, toItem: iconView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .CenterY, relatedBy: .Equal, toItem: iconView, attribute: .CenterY, multiplier: 1.0, constant: 0))
        // 3> 消息文字
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .CenterX, relatedBy: .Equal, toItem: iconView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .Top, relatedBy: .Equal, toItem: iconView, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 35))
        // 4> 注册按钮
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .Left, relatedBy: .Equal, toItem: messageLabel, attribute: .Left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .Top, relatedBy: .Equal, toItem: messageLabel, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 35))
        // 5> 登录按钮
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Right, relatedBy: .Equal, toItem: messageLabel, attribute: .Right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Top, relatedBy: .Equal, toItem: messageLabel, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 35))
        
        // 6> 遮罩视图 VFL
        /**
        VFL:     可视化格式语言
        H:      水平方向
        V:      垂直方向
        |       边界
        []      包含控件的名称字符串，对应关系在 views 字典中定义
        ()      定义控件的宽/高
        metrics: 是一个字典 [String: NSNumber] - 定义 VFL 中的约束数值
        views:   是一个字典 [String: 子视图] - 定义 VFL 中的子视图的名称，能够保证准确设置控件对象
        */
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[mask]-0-|", options: [], metrics: nil, views: ["mask": maskIconView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[mask]-(btnHeight)-[regButton]", options: [], metrics: ["btnHeight": -70], views: ["mask": maskIconView, "regButton": registerButton]))
        
        // 设置背景颜色 R = G = B 灰度图
        // 如何提高程序的性能：如果能够使用颜色就不要使用图片，绝大多数的素材，都是灰度或者单色
        backgroundColor = UIColor(white: 237.0 / 255.0, alpha: 1.0)

    }
    
    
    // MARK: - 懒加载控件
    /// 图标 - 如果使用 image 创建 UIImageView，大小默认就是图像大小
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    /// 遮罩图片
    private lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    /// 小房子
    private lazy var homeIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    /// 描述文字
    private lazy var messageLabel: UILabel = UILabel(title: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜", color: UIColor.darkGrayColor(), fontSize: 14)
    /// 注册按钮
    lazy var registerButton: UIButton = UIButton(title: "注册", fontSize: 14, color: UIColor.orangeColor(), backImageName: "common_button_white_disable")
    /// 登录按钮
    lazy var loginButton: UIButton = UIButton(title: "登录", fontSize: 14, color: UIColor.darkGrayColor(), backImageName: "common_button_white_disable")
}
