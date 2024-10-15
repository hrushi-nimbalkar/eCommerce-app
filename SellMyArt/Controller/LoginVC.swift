//
//  LoginVCViewController.swift
//  SellMyArt
//
//  Created by Hrushikesh Nimbalkar on 15/10/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func forPassClcked(_ sender: Any) {
        
        
    }
    

    @IBAction func lginClcked(_ sender: Any) {
        signInUsingFirebase()
        
    }
    
    @IBAction func guestClcked(_ sender: Any) {
        
        
    }
   
  func signInUsingFirebase(){
      guard let email = emailTxt.text, email.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else{
                return
            }
      
      Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
        guard let strongSelf = self else { return }
          
          if let error = error{
              print(error.localizedDescription)
              return
          }
          
          self?.activityIndicator.startAnimating()
          
          print("loginSuccessful")
          
          DispatchQueue.main.async {
              self?.activityIndicator.stopAnimating()
          }
      }
    }

}
