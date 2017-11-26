//
//  RegisterController.swift
//  RefugeeApp
//
//  Created by Javier Andres Vidoza  on 2017-11-25.
//  Copyright © 2017 Mansoor Shah Said. All rights reserved.
//

import UIKit

class RegisterController: UIViewController, UIScrollViewDelegate {
    
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white//Setting the background color for the view
        
        view.addSubview(inputsContainerView)
        setupScrollView()
//
//        setupEmailTextField()
//        setupPasswordTextField()
//        setupGenderTextField()
//        setupFirstNameTextField()
//        setupLastNameTextField()
//        setupAgeNameTextField()
//        setupCountryOfOriginTextField()
//        setupProfessionTextField()
//        setupRegisterButton()
        
       // createDatePicker()
        createDatePicker2 ()
        
        

    }
    
    let inputsContainerView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.white
        //Setting it to false so we can add constraint like we are doing below.(System choses constraitns automatically if set to TRUE)
        // If you want to use Auto Layout to dynamically calculate the size and position of your view, you must set this property to false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
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
    
    let genderTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Gender"
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First Name"
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Last Name"
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let ageTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Date Of Birth"
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let countryOfOriginTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Country of Origin"
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let professionTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Profession"
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    
    func createDatePicker (){
        // format for picker
        datePicker.datePickerMode = .date
        datePicker.backgroundColor =  UIColor(r: 41, g: 199, b: 150)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        //toolbar
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor(r: 41, g: 199, b: 150)
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        genderTextField.inputAccessoryView = toolbar
        
        // assigning date picker to text field
        
        genderTextField.inputView = datePicker
    }
    
    func createDatePicker2 (){
        // format for picker
        datePicker.datePickerMode = .date
        datePicker.backgroundColor =  UIColor(r: 41, g: 199, b: 150)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        //toolbar
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor(r: 41, g: 199, b: 150)
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar.setItems([doneButton], animated: false)
        
        ageTextField.inputAccessoryView = toolbar
        
        // assigning date picker to text field
        
        ageTextField.inputView = datePicker
    }
    
    @objc func donePressed (){

        self.view.endEditing(true)
    }
    
   @objc func donePressed2 (){
        
        // format date
        let userDateFormatter = DateFormatter()
        userDateFormatter.dateStyle = .long
        userDateFormatter.timeStyle = .none
        
        ageTextField.text = userDateFormatter.string(from: datePicker.date)

        self.view.endEditing(true)
        
    }
    
    
    func setupScrollView(){
        
        inputsContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        inputsContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        inputsContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(passwordTextField)
        inputsContainerView.addSubview(genderTextField)
        inputsContainerView.addSubview(firstNameTextField)
        inputsContainerView.addSubview(lastNameTextField)
        inputsContainerView.addSubview(ageTextField)
        inputsContainerView.addSubview(countryOfOriginTextField)
        inputsContainerView.addSubview(professionTextField)
        inputsContainerView.addSubview(loginRegisterButton)
        
        
        
        // need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true

        
        // need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25).isActive = true
        

        // need x, y, width, height constraints
        genderTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        genderTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        genderTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        
        
        // need x, y, width, height constraints
        firstNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        firstNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        firstNameTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 25).isActive = true

        
        // need x, y, width, height constraints
        lastNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        lastNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 25).isActive = true
        

        // need x, y, width, height constraints
        ageTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        ageTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        ageTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 25).isActive = true
        
        // need x, y, width, height constraints
        countryOfOriginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        countryOfOriginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        countryOfOriginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        countryOfOriginTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 25).isActive = true
        

        // need x, y, width, height constraints
        professionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        professionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        professionTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        professionTextField.topAnchor.constraint(equalTo: countryOfOriginTextField.bottomAnchor, constant: 25).isActive = true

        
        // need x, y, width, height constraints
        loginRegisterButton.topAnchor.constraint(equalTo: professionTextField.bottomAnchor, constant: 25).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginRegisterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        loginRegisterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        
    }
    
    
   @objc  func handleLoginRegister(){

    let email = emailTextField.text
    let password = passwordTextField.text
    let gender = genderTextField.text
    let firstName = firstNameTextField.text
    let lastName = lastNameTextField.text
    let dateOfBirth = ageTextField.text
    let countryOfOrigin = countryOfOriginTextField.text
    let profession = professionTextField.text
    
    

    }


}

