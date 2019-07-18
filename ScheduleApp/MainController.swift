import UIKit

class MainController: UICollectionViewController {
    var activities : [Activity]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activities = initSchedule()
        
        navigationItem.title="Schedule"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.registerClass(ActivityCell.self, forCellWithReuseIdentifier: "cellId")
    }

    func initSchedule() -> [Activity]{
        let excersize=Activity(name: "Excersize",time: "20")
        let torah=Activity(name: "Torah",time: "2h")
        let guitar=Activity(name: "guitar",time: "15")
        return [excersize,torah,guitar]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReusableIdentifier("cellId", forIndexPath: indexPath)
        let activity = activities[indexPath.row]
        cell.textLabel?.text =  activity.time + " " + activity.name
        
        cell.backgroundColor = UIColor.blue 
        return cell
    }
}

class ActivityCell: UICollectionViewCell{

override 
init(frame : CGRect) {
    super.init(frame: frame)
    setUpViews()
}

required init?(coder aDecoder: NSCoder){
    fatalError("init(coder:) has not been implemented")
}

func setUpViews(

)

}
