//
//  Colors.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import UIKit


enum Colors : String{
    
    case primaryColor
    case secondaryColor
    case colorAccent
    case secondaryTextColor
    case primaryTextColor
    
    var value : UIColor {
        return UIColor(named: self.rawValue) ?? .black
    }
    
}
