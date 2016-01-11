//
//  HomeViewController.swift
//  ProjectSwift
//
//  Created by langyue on 16/1/11.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import SnapKit



class HomeCell: UITableViewCell {
    
    var imagView = UIImageView()
    
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.contentView.addSubview(imagView)
            imageView!.snp_makeConstraints { (make) -> Void in
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.top.equalTo(0)
                make.bottom.equalTo(0)
            }
        
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
    
}


class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tabView: UITableView!
    
    
    
    var imgAry = ["checkCar22","iAgency22","acci22","NewActive22"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.activityIndicatorViewStart(self.view)
        
        tabView.delegate = self
        tabView.dataSource = self
        
        tabView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(69)
            make.left.equalTo(self.view).offset(5)
            make.bottom.equalTo(self.view).offset(-5)
            make.right.equalTo(self.view).offset(-5)
        }
        
        
        
        let scrollView = UIScrollView()
        self.tabView.tableHeaderView = scrollView
        scrollView.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(250)
            make.width.equalTo(ScreenWidth)
//            make.top.equalTo(self.view).offset(0)
//            make.left.equalTo(self.view).offset(0)
//            make.right.equalTo(self.view).offset(0)
        }
        scrollView.backgroundColor = UIColor.grayColor()
        
        
        
        
        // Do any additional setup after loading the view.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.imgAry.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let ID = "ID"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as! HomeCell?
        
        if cell == nil {
            
            cell = HomeCell(style: .Default, reuseIdentifier: ID)

            
        }
        
        
        cell!.imagView.image = UIImage(named: self.imgAry[indexPath.row])
        
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
