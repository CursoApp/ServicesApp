//
//  ViewController.swift
//  ServicesApp
//
//  Created by Mañanas on 13/9/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
        
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //Botones login y Creacion CTA.
    
    @IBAction func Login(_ sender: Any) {
        let email = usernameTextField.text!
        let password = passwordTextField.text!
                
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        
            if let error = error {
                print("Error al iniciar sesión")
                print(error.localizedDescription)
                return
            } 
            else {
                print("Registro correcto")
            }
        }
    }
        

    
    
    @IBAction func Createacount(_ sender: Any) {
        let email = usernameTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
        }
        
    }
    
}

