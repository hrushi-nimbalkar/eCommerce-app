//
//  ReisterVC.swift
//  SellMyArt
//
//  Created by Hrushikesh Nimbalkar on 15/10/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterVC: UIViewController {

    
    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confermPasswordTxt: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passCheckImg: UIImageView!
    
    @IBOutlet weak var confermPassCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTxt.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)
        confermPasswordTxt.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)


    }
    
    @objc func textFieldDidChanged(_ textField: UITextField){
        
        guard let passText = passwordTxt.text else{
            return
        }
       
        if textField == confermPasswordTxt{
            passCheckImg.isHidden = false
            confermPassCheckImg.isHidden = false
        } else{
            if passText.isEmpty{
                passCheckImg.isHidden = true
                confermPassCheckImg.isHidden = true
                confermPasswordTxt.text = ""
            }
        }
        //make something through which which we can mae]ke the checkbox img to green if the conferm and password matches
        if passwordTxt.text == confermPasswordTxt.text{
            passCheckImg.image = UIImage(named: AppImages.greenCheck)
            confermPassCheckImg.image = UIImage(named: AppImages.greenCheck)
        }else{
            passCheckImg.image = UIImage(named: AppImages.redcheck)
            confermPassCheckImg.image = UIImage(named: AppImages.redcheck)
        }
    }

    @IBAction func registerClcked(_ sender: Any) {
        
        firebaseCallback()
    }
 
    func firebaseCallback(){
        guard let email = emailTxt.text, email.isNotEmpty,
              let password = passwordTxt.text, password.isNotEmpty,
              let username =  userNameTxt.text, username.isNotEmpty else{
            return
        }
        
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if authResult != nil {
                print("registeration is successfull", authResult as Any)
            }
            if let error = error{
                print(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()

            }
        }
    }
    
}
