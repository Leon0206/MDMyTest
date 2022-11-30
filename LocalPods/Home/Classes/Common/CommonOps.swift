//
//  CommonOps.swift
//  Home
//
//  Created by lizitao on 2022/11/30.
//

import Foundation
import AKOCommonToolsKit

public extension UIImage {
    class func home_image_named(_ imageName: String) -> UIImage {
        return  UIImage.ako_imageNamed(imageName, withBundleName: "Home")
    }
     
}

 
