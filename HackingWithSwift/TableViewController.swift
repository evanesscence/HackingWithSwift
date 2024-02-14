import UIKit
import Foundation

class TableViewController: UITableViewController {
    var websites = ["hackingwithswift.com", "youtube.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Main") as? ViewController {
//            vc.website = websites[indexPath.row]
//            navigationController?.pushViewController(vc, animated: true)
//        }
        if let vc = storyboard?.instantiateViewController(withIdentifier: "test") as? testViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
