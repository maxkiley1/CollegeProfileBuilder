

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var colleges: [College] = []
    @IBOutlet weak var myTableView: UITableView!
    override func viewWillAppear(animated: Bool)
    {
        myTableView.reloadData()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //setting datasource and delegate to the view controller
        myTableView.dataSource = self
        myTableView.delegate = self
        //this assigns a new College and all of its properties to the array colleges
        colleges.append(College(Name:"University of Illinois", Location: "Urbana-Champaign, Illinois", NumberOfStudents: 44087, Picture: UIImage(named: "illinois")!, Website: "illinois.edu"))
        colleges.append(College(Name: "University of Wisconsin - Madison", Location: "Madison, Wisconsin", NumberOfStudents: 43193, Picture: UIImage(named: "madison")!, Website: "wisc.edu/"))
        colleges.append(College(Name: "Iowa State University", Location: "Ames, Iowa", NumberOfStudents: 34732, Picture: UIImage(named: "iowa")!, Website: "www.iastate.edu/"))
        myTableView.reloadData()

    
    
    }
    
    @IBAction func addButtonTapped(sender: AnyObject)
    {
        //this line of code creates an alert
        let myAlert = UIAlertController(title: "Add college", message: nil, preferredStyle: .Alert)
        // this line of code creates a cancel button on this alert
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        //adds another item to the table view
        let addAction = UIAlertAction(title: "Add", style: .Default)
            { (addAction) -> Void in
                let collegeNameTextField = myAlert.textFields![0] as UITextField
                let locationTextField = myAlert.textFields![1] as UITextField
                let webSiteTextField = myAlert.textFields![2] as UITextField
                self.colleges.append(College(Name: collegeNameTextField.text!, Location: locationTextField.text!, Website: webSiteTextField.text!))
                self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        //add text field
        myAlert.addTextFieldWithConfigurationHandler
            {
                (collegeTextField) -> Void in
                collegeTextField.placeholder = "Add college name"
        }
        //add text field
        myAlert.addTextFieldWithConfigurationHandler
            {
                (locationTextField) -> Void in
                locationTextField.placeholder = "Add location"
        }
        //add text field
        myAlert.addTextFieldWithConfigurationHandler
            {
                (webSiteTextField) -> Void in
                webSiteTextField.placeholder = "Add website"
        }
        
        
        //this line of code presents the alert in the View Controller
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func editButtonTapped(sender: AnyObject)
    {
        myTableView.editing = !myTableView.editing
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
        }
        
        myTableView.reloadData()

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
    //creating a cell that would store your data on a tableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = colleges[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myTableViewCell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectRow = myTableView.indexPathForSelectedRow?.row
        detailVC.college = colleges[selectRow!]
    }

}

