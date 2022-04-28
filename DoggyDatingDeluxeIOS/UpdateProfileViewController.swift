//
//  UpdateProfileViewController.swift
//  DoggyDatingDeluxeIOS
//
//  Created by Isaiah White-Booth on 4/22/22.
//

import UIKit
import AlamofireImage
import Parse

class UpdateProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var updUserField: UITextField!
    
    @IBOutlet weak var updPetField: UITextField!
    
    @IBOutlet weak var updBioField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func onUpdateCamera(_ sender: Any) {
    
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 200, height: 200)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage
    
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onUpdBtn(_ sender: Any) {
        // Make Changes to user
        let userClassName = PFUser.current()!.objectId!
        let query = PFQuery(className: "User")
        query.getObjectInBackground(withId: userClassName){(User: PFObject?, error:Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let User = User{
                User["username"] = self.updUserField.text!
                User["pet"] = self.updPetField.text!
                User["bio"] = self.updBioField.text!
                User.saveInBackground()
                print("Button Pressed")
            }
        }
        
        
    }
    
    
    
    @IBAction func onDelBtn(_ sender: Any) {
        // Delete Current User and Post
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
