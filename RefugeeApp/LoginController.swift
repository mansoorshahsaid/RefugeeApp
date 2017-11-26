//
//  ViewController.swift
//  RefugeeApp
//
//  Created by Mansoor Shah Said on 2017-11-25.
//  Copyright © 2017 Mansoor Shah Said. All rights reserved.
//

import UIKit
import Lottie
import Firebase
import FirebaseAuth

class LoginController: UIViewController {

    var animationView:LOTAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white//Setting the background color for the view
        
        //lay view on the main view
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)

        setuplogInTextField()
        setupPasswordTextField()
        setupRegisterButton()
        setupProfileImageView()
        
//        let screen = UIScreen.main.bounds
//        animationView = LOTAnimationView(name: "login-animation")
//        animationView.center = CGPoint(x: screen.width/2, y: screen.height - 100)
//        animationView.play()
//        animationView.setProgressWithFrame(1)
//        self.view.addSubview(animationView)
    }
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLoginRegister(){
        let email = nameTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if (error != nil || user?.uid == nil){
                print("error logging in")
                return
            }
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let userID = user?.uid
            Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as! [String:Any]
                
                appDelegate.userGlobal = User(user: user!, dictionary: dictionary)
                print(appDelegate.userGlobal)
                
                
            }) { (error) in
                print(error.localizedDescription)
            }
        }
        
//        animationView.play { (true) in
//            self.animationView.setProgressWithFrame(1)
//        }
    }
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImaveView)))
        
        return imageView
    }()
    
    func setupProfileImageView(){
        // need x, y, width, height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setuplogInTextField(){
        
        // need x, y, width, height constraints
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        
    }
    
    func setupPasswordTextField(){
        
        // need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func setupRegisterButton(){
        
        // need x, y, width, height constraints
        loginRegisterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginRegisterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        loginRegisterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        
    }
    

}


//Extending the methods offered by UICOLOR
extension UIColor {
    
    convenience init(r: CGFloat, g:CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

