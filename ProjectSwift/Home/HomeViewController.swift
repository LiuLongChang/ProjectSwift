//
//  HomeViewController.swift
//  ProjectSwift
//
//  Created by langyue on 16/1/11.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import SnapKit




let rowHeight : CGFloat = 117



class HomeCell: UITableViewCell {
    
    var imagView = UIImageView()
    
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.contentView.addSubview(imagView)
            imagView.frame = CGRectMake(0, 0, ScreenWidth, rowHeight)
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
}


class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    
    @IBOutlet weak var tabView: UITableView!
    
    
    
    var imgAry = ["checkCar22","iAgency22","acci22","NewActive22"]
    let pageControl = UIPageControl(frame: CGRectMake(0,0,100,30))
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.activityIndicatorViewStart(self.view)
        
        tabView.delegate = self
        tabView.dataSource = self
        tabView.separatorStyle = .None
        tabView.showsHorizontalScrollIndicator = false
        tabView.showsVerticalScrollIndicator = false
        
        tabView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(0)
            make.left.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
        }
        
        
        
        let scrollView = UIScrollView(frame: CGRectMake(0,0,ScreenWidth,170))
        scrollView.delegate = self
        self.tabView.tableHeaderView = scrollView
        scrollView.backgroundColor = UIColor.grayColor()
        
        let bannerAry = ["checkYear":0,"promise":1,"shareHasPresent":2,"bannerCheck":3]
        for (imgStr,i) in bannerAry {
            let imaView = UIImageView(frame: CGRectMake( CGFloat(i) * ScreenWidth, 0, ScreenWidth, 170))
            imaView.image = UIImage(named: imgStr)
            imaView.userInteractionEnabled = true
            scrollView.addSubview(imaView)
            imaView.tag = 100 + i
            imaView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tapBanberAction:"))
        }
        
        scrollView.contentSize =  CGSizeMake(ScreenWidth * CGFloat(bannerAry.count) , 0)
        scrollView.pagingEnabled = true
        
        
        
        
        pageControl.numberOfPages = bannerAry.count
        pageControl.center = CGPointMake(self.view.center.x, 140)
        self.tabView.addSubview(pageControl)
        
        
        // Do any additional setup after loading the view.
    }

    func tapBanberAction(tap: UITapGestureRecognizer){
    
        let view = tap.view as! UIImageView
    
        print("\(view.tag)")
    
    
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        pageControl.currentPage =  Int(scrollView.contentOffset.x /  ScreenWidth)
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.imgAry.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let ID = "ID"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as! HomeCell?
        
        if cell == nil {
            
            cell = HomeCell(style: .Default, reuseIdentifier: ID)
            cell?.selectionStyle = .None
            
        }
        
        
        cell!.imagView.image = UIImage(named: self.imgAry[indexPath.row])
        
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return rowHeight+10
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
