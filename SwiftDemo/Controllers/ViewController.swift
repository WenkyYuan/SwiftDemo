//
//  ViewController.swift
//  SwiftDemo
//
//  Created by wenky on 15/11/19.
//  Copyright (c) 2015年 wenky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let kCustomTableViewCell = "CustomTableViewCell"
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift"
        setup()
        observeNotification()
    }
    
    //MARK: private methods
    func setup() {
        tableView.registerNib(UINib(nibName: kCustomTableViewCell, bundle: nil), forCellReuseIdentifier: kCustomTableViewCell)
    }
    
    func observeNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didReceiveNotifiction:", name: "kNotificationName", object: nil)
    }
    
    func didReceiveNotifiction(notifiction: NSNotification) {
        NSLog("didReceiveNotifiction")
        //TODO:someting
        let alert: UIAlertView = UIAlertView(title: "提示", message: "收到通知", delegate: nil, cancelButtonTitle: "确定")
        alert.show()
    }
    
    //MARK: UITableViewDataSource & UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell! = tableView.dequeueReusableCellWithIdentifier(kCustomTableViewCell, forIndexPath: indexPath) as! CustomTableViewCell
        cell.leftTitleLabel.text = NSString(format: "%zd.2015.11.13巴黎发生暴恐", indexPath.row) as String
        cell.iconImageView.image = UIImage(named: "neighbourhood_carpooling")
        
        cell.delegate = self
        
        cell.tapBlock = {
            (cell: CustomTableViewCell) ->Void in
            NSLog("tapBlock%zd", cell.tag)
        }
        
        cell.tag = indexPath.row
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
        let vc = NextViewController(nibName: "NextViewController", bundle: nil)
        vc.bgColor = UIColor.purpleColor()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    //MARK: CustomTableViewCellDelegate
    func customTableViewCellDidTapIamgeView(cell: CustomTableViewCell) {
        NSLog("didTapImageViewAtIndex:%zd", cell.tag)
    }
}

