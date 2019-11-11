//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Anirup Patnaik on 02/11/19.
//  Copyright © 2019 Virtuelabs. All rights reserved.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func makeALert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Error", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeALert(title: "Error", message: error?.localizedDescription ?? "Error!!")
                } else {
                    // SEGUE
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else {
            makeALert(title: "Error", message: "Username/Password")
        }
    }
    
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = userNameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeALert(title: "Error", message: error?.localizedDescription ?? "Error!!")
                } else {
                    // SEGUE
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            makeALert(title: "Error", message: "Username/Password")
        }
    }
}
