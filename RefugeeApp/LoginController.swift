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
        view.addSubview(loginButton)
        view.addSubview(profileImageView)
        view.addSubview(registerButton)
        view.addSubview(registerMessage)

        setuplogInTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupProfileImageView()
        setupRegisterButton()
        setupRegisterMessage()
        
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
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        
        //button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    let registerMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an account?\nClick 'Register' to make one."
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont .systemFont(ofSize: 15)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        
        return label;
    }()
    
    @objc func handleLoginRegister(){
        let email = nameTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if (error != nil){
                print("error logging in")
                return
            }
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.userGlobal = User(user: user!)
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
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func setupRegisterMessage(){
        // need x, y, width, height constraints
        //registerMessage.translatesAutoresizingMaskIntoConstraints = false
        registerMessage.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        registerMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        registerMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        registerMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func setupLoginButton(){
        
        // need x, y, width, height constraints
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        
    }
    
    func setupRegisterButton(){
        
        // need x, y, width, height constraints
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        
    }
    
   @objc func handleRegister(){
        
        self.navigationController?.pushViewController(RegisterController(), animated: true)
    }

}


//Extending the methods offered by UICOLOR
extension UIColor {
    
    convenience init(r: CGFloat, g:CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

