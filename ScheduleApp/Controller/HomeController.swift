import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var activities : [Activity] = []
    var delagte: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activities = initSchedule()
        configureNavigationBar()
        configureActivityCells()
    }
    
    //MARK: - Navbar
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func handleMenuToggle(){
        delagte?.handleMenuToggle()
    }
    
    //MARK: - Cells
    
    private func initSchedule() -> [Activity]{
        let excersize=Activity(name: "excersize",time: "20")
        let code=Activity(name: "code",time: "2h")
        let guitar=Activity(name: "guitar",time: "15")
        return [excersize,code,guitar]
    }
    
    func configureActivityCells(){
        navigationItem.title = "Schedule"
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(ActivityCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(ActivityHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
    }
    
    func addNewActivity(activityName: String, activityTime: String){
        let activity = Activity(name: activityName,time: activityTime)
        activities.append(activity)
        collectionView?.reloadData()
    }
    
    //num of rows
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }

    //cell content
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ActivityCell
        //        let activity = activities[indexPath.row]
        //        cell.textLabel?.text =  activity.time + " " + activity.name
        cell.nameLabel.text = activities[indexPath.item].name

        return cell
    }

    //cell height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let h: CGFloat = 50
        return CGSize(width: view.frame.width, height: h)
    }
    
    //spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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

}
