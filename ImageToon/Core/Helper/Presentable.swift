//
//  Presentable.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}

