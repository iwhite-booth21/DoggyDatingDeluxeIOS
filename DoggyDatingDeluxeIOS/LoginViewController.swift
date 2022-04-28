//
//  LoginViewController.swift
//  DoggyDatingDeluxeIOS
//
//  Created by Isaiah White-Booth on 3/16/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
   
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginBtn(_ sender: Any) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){ (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(String(describing: error?.localizedDescription))")
            }
            
        }
    }
    
    @IBAction func onSignUpBtn(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
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
