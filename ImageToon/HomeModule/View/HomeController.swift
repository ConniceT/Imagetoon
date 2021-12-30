//
//  HomeController.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import UIKit

class HomeController: UITabBarController, HomeControllerView {
    
    var onPhotoPageSelected: ((UINavigationController) -> ())?
    var onVideoPageSelected: ((UINavigationController) -> ())?
    var onViewDidLoad: ((UINavigationController) -> ())?

    
    let childNavControllers : [UIViewController]

    init(controllers : [UIViewController]){
        self.childNavControllers = controllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.viewControllers = childNavControllers

        //navigationController?.setNavigationBarHidden(true, animated: false)
//        UITabBar.appearance().layer.borderWidth = 0.0
//        UITabBar.appearance().barTintColor = .white
//        UITabBar.appearance().isTranslucent = false
        
//        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else {
//            print("Unable")
//            return }
//        onViewDidLoad?(controller)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setViewControllers(childNavControllers, animated: false)
        //selectedIndex = 0
        
       // guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
       // onViewDidLoad?(controller)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
//        switch selectedIndex {
//            case 0:
//                onPhotoPageSelected?(controller)
//            case 1:
//                onVideoPageSelected?(controller)
//            default:
//                onPhotoPageSelected?(controller )
//        }
//        
//    }


}
