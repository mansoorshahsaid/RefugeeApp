//
//  ViewController.swift
//  RefugeeApp
//
//  Created by Mansoor Shah Said on 2017-11-25.
//  Copyright © 2017 Mansoor Shah Said. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

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
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        
        //button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
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
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
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

