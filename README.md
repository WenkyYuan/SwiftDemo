# SwiftDemo
通过实践（UITableView）学习Swift语法，包括通知中心，代理，Block等知识

##说明
######本人不习惯使用storyboard，所以次工程使用xib搭建。（删除系统生成的MainStoryBoard.storyboard和删除info.plist中关于MainStoryBoard的信息即可），入口代码详见AppDelegate。
######本demo可能不是很严谨，欢迎各位大牛指正

###Swift中的AppDelegate入口
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        let vc: ViewController = ViewController(nibName: "ViewController", bundle: nil)
        let nav: UINavigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
###Swift中的导航栏
- 创建左右按钮
