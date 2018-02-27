//
//  ViewController.swift
//  CoreImageBlur
//
//  Created by GujyHy on 2018/1/30.
//  Copyright © 2018年 GujyHy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named:"blur")
        
        // 极客 第一课
        /*--------- CoreImage 部分 ---------*/
        // CIImage
        let ciImage = CIImage(image: image!)
        // 通过分类 查找这个分类 里面 所有的滤镜效果
        //        print(CIFilter.filterNames(inCategory: kCICategoryStillImage))
        
        // CGFilter
        let ciFliter = CIFilter(name: "CIGaussianBlur")
        
        // 将图片放入到滤镜中
        ciFliter?.setValue(ciImage, forKey: kCIInputImageKey)
        // 查看滤镜的所有属性
        //         print(ciFliter?.attributes)
        
        // 设置模糊程度
        ciFliter?.setValue(100, forKey: "inputRadius")
        
        // 将处理好的图片输出
        let outCiImage:CIImage = ciFliter?.value(forKey: kCIOutputImageKey) as! CIImage
        
        // CIContext = coreImage 的操作句柄
        let ciContext = CIContext(options: nil)
        
        // 获取CGImage的操作句柄
        let outCGImage = ciContext.createCGImage(outCiImage, from: outCiImage.extent)
        
        // 最终获取到图片
        let blurImage:UIImage =  UIImage(cgImage: outCGImage!)
        
        /*--------- CoreImage 部分 ---------*/
        
        
        let imageView    = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        imageView.center = self.view.center
        //        imageView.image = image
        imageView.image = blurImage
        self.view.addSubview(imageView)
    }

   

}

