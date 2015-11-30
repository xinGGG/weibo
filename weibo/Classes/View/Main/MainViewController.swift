//
//  MainViewController.swift
//  GZWeibo
//
//  Created by Apple on 15/9/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    override func viewWillAppear(animated: Bool) {
    
        super.viewWillAppear(animated)
        
        tabBar.bringSubviewToFront(ComposeBtn)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        addChildViewController()
        
        addComposeBtn()
        
    }
    
 
    
    /// 添加子控制器
    private func addChildViewController() {
        
        tabBar.tintColor = UIColor.orangeColor()
        
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        
        // 添加了一个空的控制器
        addChildViewController(UIViewController())
        
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
        // 设置标题 - 从内向外设置

    }
    
    /**
     添加自定义按钮
     */
    private func addComposeBtn() {
        
        tabBar.addSubview(ComposeBtn)
        
        let count = self.childViewControllers.count
        
        let w = tabBar.bounds.width / CGFloat(count) - 1
        
        ComposeBtn.frame = CGRectInset(tabBar.bounds, w * 2, 0)
        
        ComposeBtn.addTarget(self, action: "clickComposedButton", forControlEvents: .TouchUpInside)

    }
    
    @objc private func clickComposedButton(){
        print("点击按钮")
    }
    
    /**
     公用addChild方法
     
     - parameter vc:    控制器
     - parameter title: 标题
     - parameter image: 图片
     */
    private func addChildViewController(vc: UIViewController,title:String,imageName:String) {
        
        vc.title = title
        //        vc.navigationItem.title = "首页"
        vc.tabBarItem.image = UIImage(named: imageName)
        
        let nav = UINavigationController(rootViewController: vc)
        
        addChildViewController(nav)
    
    }
    
//    private lazy var ComposeBtn:UIButton = {
//        
//        var btn = UIButton()
//        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
//        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), forState: UIControlState.Normal)
//        
//        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
//        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
//     
//        return btn
//    }()
    
    private lazy var ComposeBtn:UIButton = UIButton.init(imageName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")
    
    
}
