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

	`cell.leftTitleLabel.text = NSString(format: "%zd.2015.11.13巴黎发生暴恐", indexPath.row) as Strongring`

###Swift中的UITableView

- 自定义cell的TableView

    - 注册自定义cell
    
        `let kCustomTableViewCell = "CustomTableViewCell"`
        `tableView.registerNib(UINib(nibName: kCustomTableViewCell, bundle: nil), forCellReuseIdentifier: kCustomTableViewCell)`
        
    - 配置cell（cellForRow）
    
	<pre><code>func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell! = tableView.dequeueReusableCellWithIdentifier(kCustomTableViewCell, forIndexPath: indexPath) as! CustomTableViewCell
        cell.leftTitleLabel.text = NSString(format: "%zd.2015.11.13巴黎发生暴恐", indexPath.row) as String
        cell.iconImageView.image = UIImage(named: "neighbourhood_carpooling")
        return cell;
    }</code></pre>
    
- 默认cell的TableView

	- 注册cell

	`let kMyTableViewCell = "CellIdentifier"`
	`tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kMyTableViewCell)`
    
   - 配置cell

   ```
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(kMyTableViewCell, forIndexPath: indexPath) as! UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: kMyTableViewCell)
        }
        cell.textLabel?.text = "你好"
        return cell;
    }
   ```
   
###Swift中的通知中心

- 在viewDidLoad中注册通知中心
 
 ```
 func observeNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didReceiveNotifiction:", name: "kNotificationName", object: nil)
    }

    func didReceiveNotifiction(notifiction: NSNotification) {
        NSLog("didReceiveNotifiction")
        //TODO:someting
    }
 ```

- 在deint中注销通知中心（iOS9开始不再需要注销）

	```
	deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
```

- 触发通知

    `NSNotificationCenter.defaultCenter().postNotificationName("kNotificationName", object: nil)`
    
###Swifit中的delegate

######参考Demo中的CustomTableViewCell

- 定义delegate(CustomTableViewCell)

    ```
    protocol CustomTableViewCellDelegate {
    	func customTableViewCellDidTapIamgeView(cell: CustomTableViewCell)
	}
    ```
- 声明一个delegate属性(CustomTableViewCell)

    `var delegate: CustomTableViewCellDelegate?`

- 响应delegate(CustomTableViewCell)

    ```
    func didTapIamgeView() {
        if delegate != nil {
            delegate?.customTableViewCellDidTapIamgeView(self)
        }
    }
    ```

- 实现delegate的协议方法(ViewController)

    - ViewController遵循该delegate协议
    
    	```
    	class ViewController: UIViewController, CustomTableViewCellDelegate {
    		...
    	}
    	```	
    	
    - 由ViewController代理
    
    	`cell.delegate = self`
    	
    - 实现delegate方法
    
    	```
    	func customTableViewCellDidTapIamgeView(cell: CustomTableViewCell) {
      		NSLog("didTapImageViewAtIndex:%zd", cell.tag)
      		//TODO:someting
    	}
    	```
    	
###Swift中的Block

- 定义Block，参数为CustomTableViewCell类型，返回为空。（CustomTableViewCell中）

    `typealias CustomCellActionBlock = (CustomTableViewCell) ->Void`

- 声明一个Block属性（CustomTableViewCell中）

    `var tapBlock: CustomCellActionBlock?`

- 响应Block（CustomTableViewCell中）
    
	```
	func didTapIamgeView() {
    	if let block = self.tapBlock {
    		block(self)
		}
	}
	```

- 执行Block（ViewController中）

    ```
    cell.tapBlock = {
     	(cell: CustomTableViewCell) ->Void in
     	NSLog("tapBlock%zd", cell.tag)
     	//TODO:someting
	}
    ```

###Swift综合

- 关于代码Mark

    - 在objc中为 `#pragma mark -`

    - 在Swift中为  `//MARK:`

- 关于self

    - 获取属性不再需要`self.属性`，直接使用属性即可，如果局部变量/常量名称与本地属性名称冲突，才需要使用`self.属性`获取

    - 使用.self获取class： `tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")`