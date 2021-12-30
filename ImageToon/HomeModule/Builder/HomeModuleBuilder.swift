//
//  PhotoModuleBuilder.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import Foundation
import UIKit


struct HomeModuleBuilder{
   
    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        //navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

}


extension HomeModuleBuilder : HomeModuleBuilding {
    
    func view() -> UIViewController{
        
        let router = RouterImpl(rootController: UINavigationController())
        let photoNavigationController  = createNavController(for: PhotoListController(), title: "Photo", image: UIImage(named: "picIcon") ?? UIImage())
        
//        let videoNavigationController = VideoController()
//        videoNavigationController.tabBarItem  = UITabBarItem(title: "Video",
//                                                                image: UIImage(systemName: "recordingtape"), tag: 1)
        let videoNavigationController = createNavController(for: VideoController(), title: "Video", image: UIImage(named: "videoIcon") ?? UIImage())
        let homeController = HomeController(controllers: [photoNavigationController, videoNavigationController])
        
        homeController.tabBar.barTintColor = Colors.primaryColor.value
       // homeController.tabBar.tintColor = Colors.primaryTextColor.value
        homeController.tabBar.isTranslucent = false
        //router.setRootModule(homeController, hideBar: true)
        return homeController
        
    }
    
}
