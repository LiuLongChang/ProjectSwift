//
//  BaseViewController.swift
//  ProjectSwift
//
//  Created by langyue on 16/1/11.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit


let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height



class BaseViewController: UIViewController {
    
    
    let activityIndicatorView =  UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initBaseUI()
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func initBaseUI(){
        self.view.backgroundColor = UIColor.lightGrayColor()
        //初始化菊花控制器
        activityIndicatorView.frame = CGRectMake(ScreenWidth/2-50, ScreenHeight/2-50, 100, 100)
        activityIndicatorView.color = UIColor.blackColor()
     
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.translucent = false
        
        
        let btn =  OBShapeButton(type: .Custom)
        btn.setImage(UIImage(named: "logoNew"), forState: .Normal)
        self.navigationController?.navigationBar.addSubview(btn);
        btn.center = CGPointMake(ScreenWidth/2,42)
        btn.bounds = CGRectMake(0, 0, 84, 73)
        btn.addTarget(self, action: "homeBtnAction:", forControlEvents: .TouchUpInside)
        
        
        
    }
    
    
    
    func homeBtnAction(btn:UIButton){
        
        print("点击了Home Btn");
    }
    
    
    //指示器的开启和停止方法
    func activityIndicatorViewStart(view:UIView){
        if (activityIndicatorView.superview != nil) {
            activityIndicatorView.removeFromSuperview()
        }
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
    }
    
    func activityIndicatorViewStop(){
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
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











