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
    var bgColor: UIColor?
    let url: String = "http://www.baidu.com"

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
        let webUrl: NSURL = NSURL(string: url)!
        let request: NSURLRequest = NSURLRequest(URL: webUrl)
        webView.loadRequest(request)
    }
    
    func didTapBar() {
        NSNotificationCenter.defaultCenter().postNotificationName("kNotificationName", object: nil)
        navigationController?.popViewControllerAnimated(true)
    }
}