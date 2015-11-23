//
//  NextViewController.swift
//  SwiftDemo
//
//  Created by wenky on 15/11/19.
//  Copyright (c) 2015年 wenky. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var bgColor: UIColor?
    
    deinit {
        NSLog("dealloc")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Next"
        view.backgroundColor = bgColor==nil ? UIColor.redColor() : bgColor
        setupNavBar()
    }
    
    func setupNavBar() {
        let item: UIBarButtonItem = UIBarButtonItem(title: "通知", style: UIBarButtonItemStyle.Plain, target: self, action: "didTapBar")
        navigationItem.rightBarButtonItem = item
    }
    
    func didTapBar() {
        NSNotificationCenter.defaultCenter().postNotificationName("kNotificationName", object: nil)
        navigationController?.popViewControllerAnimated(true)
    }
}