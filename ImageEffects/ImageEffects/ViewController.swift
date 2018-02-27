//
//  ViewController.swift
//  ImageEffects
//
//  Created by GujyHy on 2018/1/30.
//  Copyright © 2018年 GujyHy. All rights reserved.
//

import UIKit
//let kScreenW = UIScreen.main.bounds.width
//let kScreenH = UIScreen.main.bounds.height
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = UIImage(named:"blur")!
//        image = image?.blur()
        image = image.blurImage(atFrame: CGRect(x: 0, y: 100,
                                                 width: image.size.width,
                                                 height:image.size.height/2))
        
        let imageView = UIImageView(frame: self.view.bounds)
   
        imageView.image = image
        self.view.addSubview(imageView)
        
    }

  

}

