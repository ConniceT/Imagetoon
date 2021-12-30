//
//  TimeInterval.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/30/21.
//

import Foundation

extension TimeInterval{
    
    func getString() -> String{
        let ti = NSInteger(self)
                
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        if hours <= 0{
            return  minutes > 0 ? String(format: "%0.2d:%0.2d", minutes,seconds)  : String(format: "00:%0.2d", seconds)
        }
        
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
       
    }
}
