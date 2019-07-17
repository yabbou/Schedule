import UIKit

class MainController: UITableViewController {
    var activities : [Activity]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activities = initSchedule()
        
        navigationItem.title="Shedule"
        tableView?.backgroundColor=UIColor.green
    }

    func initSchedule() -> [Activity]{
        let excersize=Activity(name: "Excersize",time: "20")
        let torah=Activity(name: "Torah",time: "2h")
        let guitar=Activity(name: "guitar",time: "15")
        return [excersize,torah,guitar]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let activity = activities[indexPath.row]
        cell.textLabel?.text =  activity.time + " " + activity.name
        
        return cell
    }
}
