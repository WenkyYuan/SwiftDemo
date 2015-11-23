//
//  NextViewController.swift
//  SwiftDemo
//
//  Created by wenky on 15/11/19.
//  Copyright (c) 2015年 wenky. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    let url: String = "http://www.baidu.com" //初始化为百度网址字符串，常量
    var bgColor: UIColor?       //初始化为nil,因为生命周期中，(理想状态)可能为nil所以用?

    deinit {
        NSLog("dealloc")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Next"
        view.backgroundColor = bgColor==nil ? UIColor.redColor() : bgColor
        setupNavBarItem()
        setupWebView()
    }
    
    func setupNavBarItem() {
        let item: UIBarButtonItem = UIBarButtonItem(title: "通知", style: UIBarButtonItemStyle.Plain, target: self, action: "didTapBar")
        navigationItem.rightBarButtonItem = item
    }
    
    func setupWebView() {
        let webUrl: NSURL! = NSURL(string: url)
        let request: NSURLRequest = NSURLRequest(URL: webUrl)
        webView.loadRequest(request)
    }
    
    func didTapBar() {
        NSNotificationCenter.defaultCenter().postNotificationName("kNotificationName", object: nil)
        navigationController?.popViewControllerAnimated(true)
    }
}