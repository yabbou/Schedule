//
//  ActivityCell.swift
//  ScheduleApp
//
//  Created by Yaakov on 21 Tamuz 5779.
//  Copyright © 5779 Yaakov. All rights reserved.
//

import UIKit

class BaseCell : UICollectionViewCell{
    override init(frame : CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
    }
}

class ActivityHeader: BaseCell{
    var controller: HomeController?
    
    let activityNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Activity Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let addActivityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Activity", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setUpViews(){
        addSubview(activityNameTextField)
        addSubview(addActivityButton)
        
        addActivityButton.addTarget(self, action: #selector(addActivity), for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-[v1(80)]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : activityNameTextField, "v1": addActivityButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-24-[v0]-24-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : activityNameTextField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : addActivityButton]))
    }
    
    @objc func addActivity(){
        controller?.addNewActivity(activityName: activityNameTextField.text!, activityTime: "0") //temp time var
        activityNameTextField.text = ""
    }
}

class ActivityCell: BaseCell{
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setUpViews(){
        addSubview(nameLabel)
        
        //        backgroundColor = UIColor.cyan
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
    }
    
}
