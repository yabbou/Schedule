//
//  MenuController.swift
//  ScheduleApp
//
//  Created by Yaakov on 21 Tamuz 5779.
//  Copyright © 5779 Yaakov. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    var tableView: UITableView!
    var menuOptions:Int=4 //temp; should be array
    let reuseIdentifier = "MenuOptionCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView?.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier) 
    }

}

extension MenuController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        return cell
    }
    
}
