import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var activities : [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activities = initSchedule()
        
        navigationItem.title="Schedule"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(ActivityCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(ActivityHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
    }
    
    func initSchedule() -> [Activity]{
        let excersize=Activity(name: "excersize",time: "20")
        let code=Activity(name: "code",time: "2h")
        let guitar=Activity(name: "guitar",time: "15")
        return [excersize,code,guitar]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! ActivityCell
        cell.nameLabel.text = activities[indexPath.item].name

        //        let activity = activities[indexPath.row]
        //        cell.textLabel?.text =  activity.time + " " + activity.name
        
        return cell
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath)->CGSize{
        let height: CGFloat = 50;
        return CGSize(width: view.frame.width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath as IndexPath) as! ActivityHeader
        header.controller = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height: CGFloat = 100; //dry
        return CGSize(width: view.frame.width, height: height)
    }
    
    func addNewActivity(activityName: String, activityTime: String){
        let activity = Activity(name: activityName,time: activityTime)
        activities.append(activity)
        
        collectionView.reloadData()
    }
    
}

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
    
    var controller: MainController?
    
    let activityNameTextField: UITextField={
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
        
        addActivityButton.addTarget(self, action: Selector(("addActivity")), for: .touchUpInside) //selctor(())?
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-[v1(80)]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : activityNameTextField, "v1": addActivityButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-24-[v0]-24-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : activityNameTextField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : addActivityButton]))
    }
    
    func addActivity(){
        controller?.addNewActivity(activityName: activityNameTextField.text!, activityTime: "nil") //temp nil
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
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
    }
    
}
