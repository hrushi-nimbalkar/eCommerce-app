//
//  ViewController.swift
//  SellMyArt
//
//  Created by Hrushikesh Nimbalkar on 14/10/24.
//

import UIKit
import FirebaseCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    override func viewDidAppear(_ animated: Bool) {
        let storybord = UIStoryboard(name: Storybord.LoginStorybord, bundle: nil)
        let controller = storybord.instantiateViewController(identifier: StorybordID.LoginVC)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: false, completion: nil)
    }

}

