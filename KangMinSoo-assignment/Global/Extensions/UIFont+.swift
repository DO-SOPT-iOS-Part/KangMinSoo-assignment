//
//  UIFont+.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/27/23.
//

import UIKit

extension UIFont {

    class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regularFont.rawValue, size: size)!
    }

    class func medium(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.mediumFont.rawValue, size: size)!
    }

    class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldFont.rawValue, size: size)!
    }
    
    class func light(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.lightFont.rawValue, size: size)!
    }
    
    class func thin(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.thinFont.rawValue, size: size)!
    }
}
