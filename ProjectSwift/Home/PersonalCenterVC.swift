//
//  PersonalCenterVC.swift
//  ProjectSwift
//
//  Created by langyue on 16/1/13.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class PersonalCenterVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tabView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.initUI()
        
        // Do any additional setup after loading the view.
    }

    
    
    
    func initUI(){
        
        tabView.delegate = self
        tabView.dataSource = self
        
        tabView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(20)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("ID") as? PersonCenterItemCell
        
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("PersonCenterItemCell", owner: nil, options: nil).last as? PersonCenterItemCell
        }
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
