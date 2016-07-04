//
//  GJJLaunchAdView.swift
//  gjjinswift
//
//  Created by apple on 2016/7/1.
//  Copyright © 2016年 QiaTu HangZhou. All rights reserved.
//

import UIKit

protocol GJJLaunchAdViewDelegate {
    func dissController()
}


class GJJLaunchAdView: UIView {
    // 代理
    var launchAddelegate : GJJLaunchAdViewDelegate?
    // 广告图片
    lazy var adImageView = {
        UIImageView()
    }()
    // 平铺背景
    lazy var maskImageView = {
        UIImageView()
    }()
    
    // 详情按钮
    lazy var detailButton = {
       UIButton()
    }()
    // logo
    lazy var logoImageView = {
        UIImageView()
    }()
    // logo文字描述
    lazy var logoDescImageView = {
        UIImageView()
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 初始化UI
        setupViews()
        // 设值
        setupViewsValue()
        
    }
    
    // 初始化UI
    func setupViews() {

        self.addSubview(adImageView)
        adImageView.addSubview(maskImageView)
        self.addSubview(detailButton)
        self.addSubview(logoImageView)
        self.addSubview(logoDescImageView)
        
        // 设置约束
       adImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([ NSLayoutConstraint.init(item: adImageView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0),
                              
                              NSLayoutConstraint.init(item: adImageView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0),
                              
                              NSLayoutConstraint.init(item: adImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0),
                              
                              NSLayoutConstraint.init(item: adImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0)])
        
        
        
        maskImageView.translatesAutoresizingMaskIntoConstraints = false
        maskImageView.alpha = 0.5
        self.addConstraints([ NSLayoutConstraint.init(item: maskImageView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: adImageView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0),
                              
                              NSLayoutConstraint.init(item: maskImageView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: adImageView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0),
                              
                              NSLayoutConstraint.init(item: maskImageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: adImageView, attribute: NSLayoutAttribute.height, multiplier: 0.5, constant: 0.0),
                              
                              NSLayoutConstraint.init(item: maskImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: adImageView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0)])
        
        // 设置logo描述
        
        logoDescImageView.translatesAutoresizingMaskIntoConstraints = false
        logoDescImageView.addConstraints([ NSLayoutConstraint.init(item: logoDescImageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 113.0),
                                           
                                           NSLayoutConstraint.init(item: logoDescImageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 20.5)])
        
        self.addConstraints([
                              NSLayoutConstraint.init(item: logoDescImageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0),
                              
                              NSLayoutConstraint.init(item: logoDescImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -25.0)])
        // 图片logo, 67
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.addConstraints([NSLayoutConstraint.init(item: logoImageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 67.0),
                                      
                                      NSLayoutConstraint.init(item: logoImageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 67.0)])
        
        self.addConstraints([
            NSLayoutConstraint.init(item: logoImageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint.init(item: logoImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.logoDescImageView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: -15.0)])
        
        // 查看详情
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        detailButton.backgroundColor = UIColor.black()
        detailButton.setTitleColor(UIColor.white(), for: UIControlState.init(rawValue: 0))
        detailButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        detailButton.addTarget(self, action: #selector(GJJLaunchAdView.detailClick), for: UIControlEvents.touchUpInside)
        
        detailButton.layer.masksToBounds = true
        detailButton.layer.cornerRadius = 12.5
        detailButton.addConstraints([NSLayoutConstraint.init(item: detailButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 80.0),
                                      
                                      NSLayoutConstraint.init(item: detailButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 25.0)])
        
        self.addConstraints([
            NSLayoutConstraint.init(item: detailButton, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -25.0),
            
            NSLayoutConstraint.init(item: detailButton, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 20.0)])
    }
    // 进入详情页面
    func detailClick() {
        // TODO 跳转到详情页面
        
    }
    
    // 设值
    func setupViewsValue() {
        // 广告图片
        adImageView.image = UIImage.init(named: "2")
        // 遮罩图片
        maskImageView.image = UIImage.init(named: "launch_mask")
        // logo文字描述
        logoDescImageView.image = UIImage.init(named: "launch_slogan")
        logoImageView.image = UIImage.init(named: "icon_launch")
        detailButton.setTitle("点击查看 >", for: UIControlState.init(rawValue: 0))
        
        adImageView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        detailButton.alpha = 0.0
//        UIView.animate(withDuration: 3.0) {
//            self.adImageView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
//            self.detailButton.alpha = 0.2
//        }
        
        UIView.animate(withDuration: 3.0, animations: { 
            self.adImageView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            self.detailButton.alpha = 0.2
            }) { (true) in
    
                self.launchAddelegate?.dissController()
        }
  
        
        
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
