//
//  LoginViewController.swift
//  Calendule
//
//  Created by Ivan on 5/9/17.
//  Copyright © 2017 Talentum. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signIn()
        // Do any additional setup after loading the view.
        
        //Ya no hace falta
        //self.logOut()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /* Ya no haria falta esta funcion
    func logOut() {
        
        if Auth.auth().currentUser != nil {
            print("Before: Login View \(Auth.auth().currentUser!)")
            do {
                try? Auth.auth().signOut()
            } catch let logOutError {
                print(logOutError)
            }
        }
        print("After: Login View \(Auth.auth().currentUser)")
    }
    */
    
}
