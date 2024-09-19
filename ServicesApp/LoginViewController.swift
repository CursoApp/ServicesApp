//
//  ViewController.swift
//  ServicesApp
//
//  Created by Mañanas on 13/9/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Realice cualquier configuración adicional después de cargar la vista.
        //Do any additional setup after loading the view.
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
                self.goToHome()
            }
        }
    }
    
    
    // Botón creación de CTA.
    
    @IBAction func Createacount(_ sender: Any) {
        let email = usernameTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // ...
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            // ...
        }
    }
    
    
    @IBAction func googleSignIn(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        //Cree un objeto de configuración de inicio de sesión de Google.
        //Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Iniciar el flujo de inicio de sesión
        //Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                print("Error obteniendo el usuario o el token")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print("Error al iniciar sesión con Google")
                    print(error.localizedDescription)
                    return
                } else {
                    print("Login correcto con Google")
                    self.goToHome()
                }
            }
        }
    }
    @IBAction func google(_ sender: Any) {
    }
    
    func goToHome() {
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
}




