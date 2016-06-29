//
//  AppDelegate.swift
//  gjjinswift
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 QiaTu HangZhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?
    let takePhotoViewController = GJJTakePhotoViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main().bounds)
        self.window?.rootViewController = setuptabBarController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
    func setuptabBarController() -> UIViewController {
        
        let inTabBarController = UITabBarController()
        inTabBarController.delegate = self
        inTabBarController.tabBar.backgroundColor = UIColor.white()
        inTabBarController.tabBar.tintColor = UIColor.init(red: 220/255.0, green: 92/255.0, blue: 108/255.0, alpha: 1)
        // 关注
        let aboutController = GJJAboutViewController()

        aboutController.title = "关注"
        
        aboutController.tabBarItem.image = UIImage.init(named: "grayfriend")
        aboutController.tabBarItem.selectedImage = UIImage.init(named: "redfriend")
        // 发现
        let findController = GJJFindViewController()
        findController.title = "发现"
        findController.tabBarItem.image = UIImage.init(named: "graydiscover")
        findController.tabBarItem.selectedImage = UIImage.init(named: "reddiscover")
        
        // 拍照
        let takePhotoController = GJJTakePhotoViewController()
        takePhotoController.tabBarItem.image = UIImage.init(named: "paizhao")
  
        // in记
        let inController = GJJInViewController()
        inController.title = "in记"
        inController.tabBarItem.image = UIImage.init(named: "grayinji")
        inController.tabBarItem.selectedImage = UIImage.init(named: "redinji")
        // 中心
        let centerController = GJJCenterViewController()
        centerController.title = "中心"
        centerController.tabBarItem.image = UIImage.init(named: "graycenter")
        centerController.tabBarItem.selectedImage = UIImage.init(named: "redcenter")
        inTabBarController.viewControllers = [aboutController, findController,takePhotoController, inController, centerController]
        
        // 取消上边线
        UITabBar.appearance().backgroundImage = UIImage.init()
        UITabBar.appearance().shadowImage = UIImage.init()
        
        inTabBarController.tabBar .insertSubview(drawTabbarBgImageView(), at: 0)
        inTabBarController.tabBar.isOpaque = true
        
        let tabBarItem = inTabBarController.tabBar.items?[2]
        tabBarItem?.imageInsets = UIEdgeInsets.init(top: -3, left: 0, bottom: 3, right: 0)
        
        
        aboutController.view.backgroundColor = UIColor.red()
        
        findController.view.backgroundColor = UIColor.purple()
        
        inController.view.backgroundColor = UIColor.orange()
        
        centerController.view.backgroundColor = UIColor.white()
        
        takePhotoController.view.backgroundColor = UIColor.blue()

        return inTabBarController
    }
    
    func drawTabbarBgImageView() -> UIImageView {
        let radius = 30.0 // 圆半径
        let tabBarHeight = 49.0
        let standOutHeight = 12.0 // 突出的高度
        let allFloat = (pow(Decimal(radius), 2)-pow(Decimal(radius-standOutHeight), 2))
        let ww = sqrtf(Float(allFloat))
        let imageView = UIImageView.init(frame: CGRect.init(x: 0.0, y: -standOutHeight, width: Double(UIScreen.main().bounds.size.width), height: tabBarHeight+standOutHeight))
        let size = imageView.frame.size
        let layer = CAShapeLayer.init()
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: size.width/2-CGFloat(ww), y: CGFloat(standOutHeight)))
        
        let angleH = 0.5*((radius-standOutHeight)/radius)
        
        let startAngle = (1+angleH)*M_PI
        let endAngle = (2-angleH)*M_PI
    
        let center = CGPoint.init(x: CGFloat((size.width)/2), y: CGFloat(radius))
        path.addArc(withCenter:center , radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
            
        path.addLine(to: CGPoint.init(x: CGFloat(size.width/2+(CGFloat)(ww)), y: CGFloat(standOutHeight)))
        path.addLine(to: CGPoint.init(x: size.width, y:
            CGFloat(standOutHeight)))
        
        path.addLine(to: CGPoint.init(x: size.width, y: size.height))
        
        path.addLine(to: CGPoint.init(x: 0, y: size.height))
        
        path.addLine(to: CGPoint.init(x: 0, y: standOutHeight))
        
        path.addLine(to: CGPoint.init(x: size.width/2-CGFloat(ww), y: CGFloat(standOutHeight)))
        layer.path = path.cgPath
        layer.fillColor = UIColor.white().cgColor
        
        layer.strokeColor = UIColor.init(white: 0.765, alpha: 1.0).cgColor
        layer.lineWidth = 0.5
        
        imageView.layer .addSublayer(layer)
     
        return imageView;
    }

    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.classForCoder.isSubclass(of: GJJTakePhotoViewController.classForCoder()) {
            
            debugPrint("点我了")
        
            viewController.present(takePhotoViewController, animated: true, completion: {
                
            })
            return false
        }
        return true

    }
    
    
    
   
}



