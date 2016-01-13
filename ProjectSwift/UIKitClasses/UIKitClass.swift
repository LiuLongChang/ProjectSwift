//
//  UIKitClass.swift
//  ProjectSwift
//
//  Created by langyue on 16/1/12.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import UIKit



class OBShapeButton: UIButton {
    
    var previousTouchPoint : CGPoint!
    var previousTouchHitTestResponse : Bool!
    var buttonImage : UIImage!
    var buttonBackground : UIImage!
    
    
    
    override var enabled : Bool {
        willSet(newValue){
            
        }
        didSet{
            self.updateImageCacheForCurrentState()
        }
    }
    override var highlighted : Bool {
        willSet(newValue){
            
        }
        didSet{
            self.updateImageCacheForCurrentState()
        }
        
    }
    override var selected : Bool {
        willSet(newValue){
            
        }
        didSet{
            self.updateImageCacheForCurrentState()
        }
    }
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        self.setUp()
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUp()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func isAlphaVisibleAtPoint(var point:CGPoint,image:UIImage)->Bool{
        
        let iSize = image.size
        let bSize = self.bounds.size
        point.x *= (bSize.width != 0) ? (iSize.width / bSize.width) : 1
        point.y *= (bSize.height != 0) ? (iSize.height / bSize.height) : 1
        let pixelColor = image.colorAtPixel(point)
        var alpha  = CGFloat(0.0)
        
        
        
        if pixelColor?.respondsToSelector("getRed:green:blue:alpha:") == true {
            pixelColor?.getRed(nil
                , green: nil, blue: nil, alpha: &alpha)
        }else{
            let cgPixelColor = pixelColor?.CGColor
            alpha = CGColorGetAlpha(cgPixelColor)
        }
        
        return CGFloat( alpha ) >=  0.1
    }
    
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        
        let superResult = super.pointInside(point, withEvent: event)
        if superResult  == false {
            return superResult
        }
        
        if CGPointEqualToPoint(point, self.previousTouchPoint){
            return self.previousTouchHitTestResponse
        }else{
            self.previousTouchPoint = point
        }
        
        var response = false
        
        if self.buttonImage == nil && self.buttonBackground == nil{
            response = true
        }else if self.buttonImage != nil && self.buttonBackground == nil {
            response = self.isAlphaVisibleAtPoint(point, image: self.buttonImage)
        }else if self.buttonImage == nil && self.buttonBackground != nil{
            response = self.isAlphaVisibleAtPoint(point, image: self.buttonBackground)
        }else{
            
            if self.isAlphaVisibleAtPoint(point, image: self.buttonImage){
                response = true
            }else{
                response = self.isAlphaVisibleAtPoint(point, image: self.buttonBackground)
            }
            
        }
        
        self.previousTouchHitTestResponse = response
        return response
        
    }
    
    
    
    
    
    override func setImage(image: UIImage?, forState state: UIControlState) {
        super.setImage(image, forState: state)
        self.updateImageCacheForCurrentState()
        self.resetHitTestCache()
    }
    
    override func setBackgroundImage(image: UIImage?, forState state: UIControlState) {
        super.setBackgroundImage(image, forState: state)
        self.updateImageCacheForCurrentState()
        self.resetHitTestCache()
        
    }
    
    
    
    
    
    
    
    func setUp(){
        self.updateImageCacheForCurrentState()
        self.resetHitTestCache()
    }
    
    func updateImageCacheForCurrentState(){
        buttonBackground = self.currentBackgroundImage
        buttonImage = self.currentImage
    }
    
    
    func resetHitTestCache(){
        self.previousTouchPoint = CGPointMake(CGFloat.min, CGFloat.min)
        self.previousTouchHitTestResponse = false
    }
    
    
}


extension UIImage {
    
    
    func colorAtPixel(point:CGPoint)->UIColor?{
        
        if CGRectContainsPoint(CGRectMake(0.0, 0.0, self.size.width, self.size.height), point) == false {
            return nil
        }
        
        let pointX = trunc(point.x) 
        let pointY = trunc(point.y) 
        let cgImage = self.CGImage
        let width = self.size.width
        let height = self.size.height
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * 1
        let bitsPerComponent = 8
        var  pixelData : [CGFloat] = [0,0,0,0]
        
        let context = CGBitmapContextCreate(&pixelData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace, CGImageAlphaInfo.PremultipliedLast.rawValue | CGBitmapInfo.ByteOrder32Big.rawValue)!
        
        
        
        CGContextSetBlendMode(context, CGBlendMode.Copy)
        CGContextTranslateCTM(context, -pointX, CGFloat(pointY) - CGFloat(height))
        CGContextDrawImage(context, CGRectMake( 0.0, 0.0, CGFloat(width), CGFloat(height)), cgImage)
        
        let red = pixelData[0] / 255.0
        let green = pixelData[1] / 255.0
        let blue = pixelData[2] / 255.0
        let alpha = pixelData[3] / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}





extension UINavigationBar{
    override public func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let view : UIView? = super.hitTest(point, withEvent: event)
        if view == nil {
            
            for subView in self.subviews {
                let tp = subView.convertPoint(point, fromView: self)
                if CGRectContainsPoint(subView.bounds, tp){
                    let view = subView
                    if view.isKindOfClass(OBShapeButton.classForCoder()){
                        let btn = view as! OBShapeButton
                        
                        let isAlpha : Bool = btn.isAlphaVisibleAtPoint(tp, image: UIImage(named: "logoNew")!)
                        
                        if (!isAlpha) {
                            
                            print("!isAlpha")
                            return nil
                        }
                        
                    }
                }
            }
            
        }
        return view
    }
}



























