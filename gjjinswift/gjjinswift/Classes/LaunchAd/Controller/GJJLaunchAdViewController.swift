//
//  GJJLaunchAdViewController.swift
//  gjjinswift
//
//  Created by apple on 2016/7/1.
//  Copyright © 2016年 QiaTu HangZhou. All rights reserved.
//

import UIKit

class GJJLaunchAdViewController: UIViewController,GJJLaunchAdViewDelegate {

    lazy var adLaunchView = {
      GJJLaunchAdView.init(frame: UIScreen.main().bounds)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        adLaunchView.launchAddelegate = self;
        self.view.addSubview(adLaunchView)
    }
    func dissController() {
        UIApplication.shared().keyWindow?.rootViewController = GJJTabBarConfig().setuptabBarController()
    }

}
