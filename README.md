# SwiftDemo
通过实践（UITableView）学习Swift，包括通知中心，代理，Block等知识

##说明
######1.不习惯使用storyboard，所以此工程使用xib搭建。（删除系统生成的Main.storyboard和删除info.plist中关于Main storyboard的配置信息即可），入口代码详见AppDelegate。
######2.demo可能不是很严谨，持续更新中，欢迎各位大牛指正

###Swift中的AppDelegate入口
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        let vc: ViewController = ViewController(nibName: "ViewController", bundle: nil)
        let nav: UINavigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
###Swift中的导航栏
    func setupNavBarItem() {
        let item: UIBarButtonItem = UIBarButtonItem(title: "通知", style: UIBarButtonItemStyle.Plain, target: self, action: "didTapBar")
        navigationItem.rightBarButtonItem = item
    }
    
- 创建导航栏左/右按钮

###Swift中的属性
    let url: String = "http://www.baidu.com" //初始化为百度网址字符串，常量
    var tableView: UITableView! //初始化为nil,因为生命周期中，(理想状态)认为不可能为nil,所以用!
    var bgColor: UIColor?       //初始化为nil,因为生命周期中，(理想状态)可能为nil所以用?
    var tableData = [String]()  //定义一个存放String类型元素的数组，并初始化

###Swift中的字符串
- 创建带格式的字符串
`cell.leftTitleLabel.text = NSString(format: "%zd.2015.11.13巴黎发生暴恐", indexPath.row) as String`
