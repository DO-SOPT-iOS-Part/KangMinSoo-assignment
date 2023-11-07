//
//  BaseView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/7/23.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        hieararchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        // override Point
        
    }
    
    func hieararchy() {
        //override Point
    }
    
    func setLayout() {
        // override Point
    }
}
