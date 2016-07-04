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
    lazy var takePhotoViewController:GJJTakePhotoViewController = {
        GJJTakePhotoViewController()
        }()
    
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main().bounds)
        
        if false { // 直接进入主页
            let inTabBarController: UITabBarController = GJJTabBarConfig().setuptabBarController()
            inTabBarController.delegate = self;
            self.window?.rootViewController = inTabBarController
        } else {
            // 开启广告页面
            self.window?.rootViewController = GJJLaunchAdViewController()
    
        }
        
     
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.classForCoder.isSubclass(of: GJJTakePhotoTabbarViewController.classForCoder()) {
            
            debugPrint("点我了")
        
            viewController.present(takePhotoViewController, animated: true, completion: {
                
            })
            return false
        }
        return true

    }
    
   
}



