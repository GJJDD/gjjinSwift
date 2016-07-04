//
//  GJJTakePhotoViewController.swift
//  gjjinswift
//
//  Created by apple on 2016/6/29.
//  Copyright © 2016年 QiaTu HangZhou. All rights reserved.
//

import UIKit

class GJJTakePhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow()
        let b = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(b)
        b.backgroundColor = UIColor.red()
        b.addTarget(self, action: #selector(GJJTakePhotoViewController.btnClick), for: UIControlEvents.touchUpInside)
        
//        test()
        
        
        
    }
    
    // 测试代码
    func test() {
        let blueView = UIView();
        
        blueView.backgroundColor = UIColor.blue()
        
        self.view.addSubview(blueView)//系统默认会给autoresizing 约束
        
        // 关闭autoresizing 不关闭否则程序崩溃
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //宽度约束
        
        let width:NSLayoutConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.width, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:0.0, constant:200)
        blueView.addConstraint(width)//自己添加约束
        
        
        
        //高度约束
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:0.0, constant:200)
        
        
        
        blueView.addConstraint(height)//自己添加约束
        
        
        //右边约束
        
        let right:NSLayoutConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.right, multiplier:1.0, constant: -20)
        
        
        
        blueView.superview!.addConstraint(right)//父控件添加约束
        
        
        //下边约束
        
        let bottom:NSLayoutConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.bottom, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.bottom, multiplier:1.0, constant: -20)
        self.view.addConstraint(bottom)//父控件添加约束
       
        
        
        
        let popView = UIView.init()
        popView.translatesAutoresizingMaskIntoConstraints = false
          blueView.addSubview(popView)
        
        popView.backgroundColor = UIColor.black()
         let popheight = NSLayoutConstraint(item: popView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 100)
           popView.addConstraint(popheight)
              let popleft = NSLayoutConstraint(item: popView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: blueView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        
        blueView.addConstraint(popleft)
     
    
        
        let popright:NSLayoutConstraint = NSLayoutConstraint(item: popView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: blueView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -10)
        blueView.addConstraint(popright)
        let poptop = NSLayoutConstraint(item: popView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: blueView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 10)
        blueView.addConstraint(poptop)
    }
    

    func btnClick() {
//        self.dismiss(animated: true) { 
//            
//        }
        
//        let adViewController = GJJLaunchAdViewController()
//        self.present(adViewController, animated: true) { 
//            
//        }
    }

}
