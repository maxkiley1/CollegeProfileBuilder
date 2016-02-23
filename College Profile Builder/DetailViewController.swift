import UIKit
import SafariServices
class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
   

    //the following code are outlets for my imageview and textfields of the detail VC
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!

    @IBOutlet weak var urlLabel: UILabel!
    
    //creates a image picker controller
    let imagePicker =  UIImagePickerController()
  
    //creates new object of type college.
    var college: College! 
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text! = college.name
        locationTextField.text! = college.location
        numberOfStudentsTextField.text! = String(college.numberOfStudents)
        myImageView.image = college.picture
        urlLabel.text = (college.website)
        imagePicker.delegate = self
    }

    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numberOfStudentsTextField.text!)!
    }
    @IBAction func webSiteButtonTapped(sender: AnyObject)
    {
        //let myURl = NSURL(fileURLWithPath: college.website)
        let myURL = NSURL(string: "https://" + college.website)
        let svc = SFSafariViewController(URL: myURL!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    @IBAction func cameraButtonTapped(sender: UIButton)
    {
        //checks if there is a camera on the device
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        else
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func photoButtonTapped(sender: UIButton)
    {
        //sets source type to photo library
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //shows the view controller of the photo library
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            //assigns selectedImage to the image view
            self.college.picture = selectedImage
            self.myImageView.image = selectedImage
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let mapVC = segue.destinationViewController as! MapViewController
        mapVC.college2 = college
    }
}
