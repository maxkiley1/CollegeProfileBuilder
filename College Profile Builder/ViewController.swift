

import UIKit

class ViewController: UIViewController
{
    
    var colleges: [College] = []
    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //setting datasource and delegate to the view controller
       // myTableView.dataSource = self
        //myTableView.delegate = self
        //this assigns a new College and all of its properties to the array colleges
        colleges.append(College(Name:"University of Illinois", Location: "Urbana-Champaign, Illinois", NumberOfStudents: 44,087, Picture: UIImage(named: "illinois")!))
        colleges.append(College(Name: "University of Wisconsin - Madison", Location: "Madison, Wisconsin", NumberOfStudents: 43,193, Picture: UIImage(Named: "madison")!))
        colleges.append(College(Name: "Iowa State University", Location: "Ames, Iowa", NumberOfStudents: 34,732, Picture: UIImage(named: "iowa")!))
    
    
    }
    
    
    
    //sets the nuber of rows in your tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    
    //allows you to delete rows from the tableview
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
        
        
    }
    //allows you to move rows
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    
 
    
}

