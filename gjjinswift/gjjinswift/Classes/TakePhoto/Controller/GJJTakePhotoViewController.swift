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
        
    }

    func btnClick() {
        self.dismiss(animated: true) { 
            
        }
    }

}
