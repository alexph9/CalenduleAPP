//
//  MainView.swift
//  Calendule
//
//  Created by Alex on 5/9/17.
//  Copyright © 2017 Talentum. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainView: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func logOut(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser!)
            do {
                try? Auth.auth().signOut()

            } catch let logOutError {
                print(logOutError)
            }
        }
        print(Auth.auth().currentUser)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(signInVC, animated: true, completion: nil)
        
    }
    
}
