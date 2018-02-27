//
//  BlurDownloadPicView.swift
//  BlurDownloadView
//
//  Created by GujyHy on 2018/1/30.
//  Copyright © 2018年 GujyHy. All rights reserved.
//

import UIKit


class BlurDownloadPicView: UIView {
    
    
    var pictureUrlString:String?
    var contentViewModel:UIViewContentMode? {
        didSet{
            self.imageView.contentMode = contentViewModel!
        }
    }
    
    fileprivate lazy var imageView:UIImageView = {
        let imgv = UIImageView(frame: self.bounds)
        return imgv
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(self.imageView)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK - lazy

    
    // MARK - Public
    func startProgress(){
        
        self.imageView.alpha = 0.1
        
        if let urlString = self.pictureUrlString {
            
            let request = URLRequest(url: URL(string:urlString)!)
            
            let session  = URLSession.shared
            let dataTask = session.dataTask(with: request, completionHandler:{
                   (data,response,error) in
                
                // 获取图片
                if let newData = data {
                    
                    let image = UIImage(data: newData)
                    
                    // 对图片进行模糊
                    let blurImage = image?.blur()
                    
                    // 在主线程里加载图片
                    GCDQueue.ExcuteInMain {
                        // 加载图片
                        self.imageView.image = blurImage
                        
                        // 添加动画效果
                        UIView.animate(withDuration: 1.0, animations: {
                            self.imageView.alpha = 1.0
                        })
                    }
                }
          
            })
            dataTask.resume()

        }
 
        
    }
    
    
    
}


