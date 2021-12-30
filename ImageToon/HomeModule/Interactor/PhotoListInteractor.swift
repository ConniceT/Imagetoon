//
//  PhotoListInteractorImpl.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import Foundation


final class PhotoModuleInteractor  : PhotoModuleInteracting {
    
    let filterRepo : ToonFilterRepository
    
    init(
        filterRepository : ToonFilterRepository
    ){
        self.filterRepo = filterRepository
    }
    
    func fetchFilters(){
        
    }
}
