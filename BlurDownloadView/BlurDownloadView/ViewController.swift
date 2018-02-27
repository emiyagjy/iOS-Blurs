//
//  ViewController.swift
//  BlurDownloadView
//
//  Created by GujyHy on 2018/1/30.
//  Copyright © 2018年 GujyHy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pictureUrl = "http://b.hiphotos.baidu.com/image/pic/item/a5c27d1ed21b0ef452442dc6d6c451da80cb3efd.jpg"
        
        let downloadPicView = BlurDownloadPicView(frame: CGRect(x: 0, y: 0, width:320, height: 400))
        downloadPicView.center           = self.view.center
        downloadPicView.contentViewModel = .scaleAspectFill
        self.view.addSubview(downloadPicView)
        downloadPicView.pictureUrlString = pictureUrl
        downloadPicView.startProgress()
    }

 

}

