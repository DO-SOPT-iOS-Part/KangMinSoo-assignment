//
//  Font.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/27/23.
//

import UIKit

enum AppFontName: String {
    
    case regularFont = "SFProDisplay-Regular"
    case mediumFont = "SFProDisplay-Medium"
    case boldFont = "SFProDisplay-Bold"
    case thinFont = "SFProDisplay-Thin"
    case lightFont = "SFProDisplay-Light"
    
    var name: String {
        return self.rawValue
    }
}
