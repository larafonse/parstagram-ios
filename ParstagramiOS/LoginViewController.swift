//
//  LoginViewController.swift
//  ParstagramiOS
//
//  Created by Nicolas Lara on 3/8/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameFiels: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: self.usernameFiels.text!, password: self.passwordField.text!) {
                  (user: PFUser?, error: Error?) -> Void in
                  if user != nil {
                      self.performSegue(withIdentifier: "loginSegue", sender: nil)
                  } else {
                      print("Error")
                  }
                }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = self.usernameFiels.text
        user.password = self.passwordField.text
        
    
        user.signUpInBackground {(succeeded: Bool, error: Error?) -> Void in
            
            if (succeeded) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error")
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
