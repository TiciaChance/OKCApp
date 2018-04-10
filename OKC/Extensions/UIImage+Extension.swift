//
//  UIImage+Extension.swift
//  OKC
//
//  Created by Laticia Chance on 3/6/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resize(newHeight: CGFloat) -> UIImage {
        var newImage = UIImage()
        let scale = newHeight / size.height
        let newWidth = size.width * scale
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        draw(in: CGRect(x: 0, y: 0,width: newWidth, height: newHeight))
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            newImage = image
        }
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
