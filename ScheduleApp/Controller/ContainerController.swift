//
//  ContainerController.swift
//  ScheduleApp
//
//  Created by Yaakov on 21 Tamuz 5779.
//  Copyright © 5779 Yaakov. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    var menuController: UIViewController!
    var centerController: UIViewController!
    var menuIsVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeContorller()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent 
    }
    
    func configureHomeContorller(){
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        homeController.delagte = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuContorller(){
        if menuController == nil {
            menuController = MenuController()
            
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showMenuController(shouldExpand: Bool) {
        var centerControllerOffset: CGFloat = 0.0
        
        if shouldExpand {
            centerControllerOffset = self.centerController.view.frame.width - 80.0
        } else{
            centerControllerOffset = 0.0
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = centerControllerOffset
        }, completion: nil)
    }
    
}

extension ContainerController: HomeControllerDelegate{
    func handleMenuToggle() {
        if !menuIsVisible{
            configureMenuContorller()
        }
        
        menuIsVisible = !menuIsVisible
        showMenuController(shouldExpand: menuIsVisible)
    }
}
