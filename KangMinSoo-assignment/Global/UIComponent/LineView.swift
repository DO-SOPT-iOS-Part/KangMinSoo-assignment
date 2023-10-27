//
//  LineView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/27/23.
//

import UIKit
import SnapKit

class LineView: UIView {
    
    // MARK: - init
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(0.2)
        }
    }
}
