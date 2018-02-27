//
//  ViewController.swift
//  VisualEffectView
//
//  Created by GujyHy on 2018/1/30.
//  Copyright © 2018年 GujyHy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加展示背景 用于显示动态模糊效果
        self.scrollView             = UIScrollView(frame: self.view.bounds)
        let imageView               = UIImageView(image: UIImage(named:"blur"))
        self.scrollView.contentSize = imageView.frame.size
        self.scrollView.bounces     = false
        self.scrollView.addSubview(imageView)
        self.view.addSubview(self.scrollView)
        
        
        /* 添加模糊效果 */
        
        // 1.创建模糊View
        let visualEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let effectView   = UIVisualEffectView(effect: visualEffect)
        
        // 2.设定尺寸
        effectView.frame = CGRect(x: 0, y: 100, width: 320, height: 200)
        
        // 3.添加到View当中
        self.view.addSubview(effectView)
        
        // 4.添加显示文本
        let label           = UILabel(frame:effectView.bounds)
        label.text          = "Visual模糊效果"
        label.font          = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
//        effectView.contentView.addSubview(label)
        
        /* 添加模糊子View的效果 */
        
        // 1.创建子模糊视图
        let subVisalEffect = UIVibrancyEffect(blurEffect: effectView.effect as! UIBlurEffect)
        let subEffectView  = UIVisualEffectView(effect: subVisalEffect)
        
        // 2.设定尺寸
        subEffectView.frame = effectView.bounds
        
        // 3.将子模糊视图添加到effectView的contentView中才能生效
        effectView.contentView.addSubview(subEffectView)
        
        // 4.添加显示的view来达到特殊的效果
        subEffectView.contentView.addSubview(label)
        
    }

}

