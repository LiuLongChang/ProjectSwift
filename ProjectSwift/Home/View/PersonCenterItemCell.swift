//
//  PersonCenterItemCell.swift
//  ProjectSwift
//
//  Created by langyue on 16/1/13.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class PersonCenterItemCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var myBillBtn: UIButton!
    @IBOutlet weak var myGarageBtn: UIButton!
    @IBOutlet weak var orgQueryBtn: UIButton!
    @IBOutlet weak var couponBtn: UIButton!
    @IBOutlet weak var treasureBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        myBillBtn.snp_makeConstraints { (make) -> Void in
            
            
        }
        
        
    }

    
    
    @IBAction func ItemBtnAction(sender: UIButton) {
        
        
        
        
        
    }
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
