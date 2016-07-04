//
//  GJJLaunchAdViewController.swift
//  gjjinswift
//
//  Created by apple on 2016/7/1.
//  Copyright © 2016年 QiaTu HangZhou. All rights reserved.
//

import UIKit

class GJJLaunchAdViewController: UIViewController,GJJLaunchAdViewDelegate, UITabBarControllerDelegate {
    lazy var takePhotoViewController:GJJTakePhotoViewController = {
        GJJTakePhotoViewController()
    }()
    lazy var adLaunchView = {
      GJJLaunchAdView.init(frame: UIScreen.main().bounds)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        adLaunchView.launchAddelegate = self;
        self.view.addSubview(adLaunchView)
    }
    func dissController() {
        
        let inTabBarController: UITabBarController = GJJTabBarConfig().setuptabBarController()
        
        inTabBarController.delegate = self;
       
        UIApplication.shared().keyWindow?.rootViewController = inTabBarController
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
