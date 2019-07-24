import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var activities : [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activities = initSchedule()
        
        navigationItem.title = "Schedule"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(ActivityCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(ActivityHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
    }
    
    private func initSchedule() -> [Activity]{
        let excersize=Activity(name: "excersize",time: "20")
        let code=Activity(name: "code",time: "2h")
        let guitar=Activity(name: "guitar",time: "15")
        return [excersize,code,guitar]
    }
    
    //num of rows
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    //row content
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ActivityCell
        //        let activity = activities[indexPath.row]
        //        cell.textLabel?.text =  activity.time + " " + activity.name
        cell.nameLabel.text = activities[indexPath.item].name

        return cell
    }
    
    //row height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let h: CGFloat = 50
        return CGSize(width: view.frame.width, height: h)
    }
    
    //header content
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath as IndexPath) as! ActivityHeader
        header.controller = self
        return header
    }
    
    //header height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let h: CGFloat = 100
        return CGSize(width: view.frame.width, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func addNewActivity(activityName: String, activityTime: String){
        let activity = Activity(name: activityName,time: activityTime)
        activities.append(activity)
        collectionView?.reloadData()
    }
}
