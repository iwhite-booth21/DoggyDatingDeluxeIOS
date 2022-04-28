//
//  SignUpViewController.swift
//  DoggyDatingDeluxeIOS
//
//  Created by Isaiah White-Booth on 3/16/22.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var petField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onFinalSignUpBtn(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        user["pet"] = petField.text
        
        user.signUpInBackground{(success, error) in
            if success{
                self.performSegue(withIdentifier: "userSignUpSegue", sender: nil)
            } else{
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
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
