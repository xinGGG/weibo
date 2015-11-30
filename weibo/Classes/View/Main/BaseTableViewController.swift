//
//  BaseTableViewController.swift
//  weibo
//
//  Created by xing on 15/11/30.
//  Copyright © 2015年 xinGGG. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    
    var userLogin = false
    
    var visitorView:VisitorView?
    
    override func loadView() {
        
        userLogin ? super.loadView():setupVisitorView();
    }
    
    private func setupVisitorView(){
        
        visitorView = VisitorView()
        
        view = visitorView
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
