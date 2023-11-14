//
//  Image.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/27/23.
//

import UIKit

public enum Image {
    
    // MARK: - Icons
    
    

    // MARK: - Background
    
    static let detailBackground = UIImage(named: "detailBackgroundImg")!
    static let weatherListBackground = UIImage(named: "buttonImage")!
    static let sunMaxFill = UIImage(systemName: "sun.max.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    static let cloudRainFill = UIImage(systemName: "cloud.rain.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    static let map = UIImage(systemName: "map")?.withRenderingMode(.alwaysTemplate)
    static let listBullet = UIImage(systemName: "list.bullet")?.withRenderingMode(.alwaysTemplate)
    static let locationFill = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysTemplate)
    static let circleFill = UIImage(systemName: "circle.fill")?.withRenderingMode(.alwaysTemplate)
    static let ellipsisCircle = UIImage(systemName: "ellipsis.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    static let calendar = UIImage(systemName: "calendar")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    static let frame = UIImage(named: "FrameImage")!
}
