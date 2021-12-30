//
//  ToonGridView.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/25/21.
//

import UIKit

class ToonGridView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = frame.width/3.0
        let height = frame.height/3.0
        
        let lineWidth = 1/UIScreen.main.scale
        
        for row in 0...1 {
            let line = UIView()
            line.backgroundColor = UIColor(white: 1, alpha: 0.8)
            line.frame = CGRect(x: 0, y: CGFloat(row + 1) * height, width: frame.width, height: lineWidth)
            addSubview(line)
        }
        
        for col in 0...1 {
            let line = UIView()
            line.backgroundColor = UIColor(white: 1, alpha: 0.8)
            line.frame = CGRect(x: CGFloat(col + 1) * width, y: 0, width: lineWidth, height: frame.height)
            addSubview(line)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
