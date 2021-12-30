//
//  PhotoListPresenterImpl.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import Foundation

final class PhotoListPresenter{
    
    private let interactor: PhotoModuleInteracting
    private let router : PhotoModuleRouting
    
    
    init(
        interactor: PhotoModuleInteracting,
        router : PhotoModuleRouting
    ){
        self.router = router
        self.interactor = interactor
    }
    
    
}
