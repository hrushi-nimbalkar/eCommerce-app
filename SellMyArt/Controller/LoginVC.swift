//
//  LoginVCViewController.swift
//  SellMyArt
//
//  Created by Hrushikesh Nimbalkar on 15/10/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginVC: UIViewController {
    @IBOutlet weak var emailtxt: UITextField!
    
    
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loginbtn: RoundedCorner!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClcked(_ sender: Any) {
        signInUsingFirebase()
        
    }
    
    @IBAction func forgotBtnClcked(_ sender: Any) {
        
        
    }
    
    @IBAction func continueAsGuestClcked(_ sender: Any) {
        
        
    }
    
    
    func signInUsingFirebase(){
        guard let email = emailtxt.text, email.isNotEmpty,
              let password = passwordtxt.text, password.isNotEmpty else{
            return
        }
        loadingIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let error = error{
                print("error", error.localizedDescription)
                DispatchQueue.main.async {
                    self?.loadingIndicator.stopAnimating()

                }
                return
            }
            
            print("loginSuccess")
            DispatchQueue.main.async {
                self?.loadingIndicator.stopAnimating()

            }
        }
    }
}
