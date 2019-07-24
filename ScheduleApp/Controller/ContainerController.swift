//
//  ContainerController.swift
//  ScheduleApp
//
//  Created by Yaakov on 21 Tamuz 5779.
//  Copyright © 5779 Yaakov. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeContorller()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent 
    }
    
    func configureHomeContorller(){
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let controller = UINavigationController(rootViewController: homeController)
        
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    func configureMenuContorller(){

    }

}

