//
//  PhotoControllerView.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import UIKit

protocol HomeControllerView : AnyObject{
    var onPhotoPageSelected : ((UINavigationController) -> ())? { get set }
    var onVideoPageSelected : ((UINavigationController) -> ())? { get set }
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }

}
