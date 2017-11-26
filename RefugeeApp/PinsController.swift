//
//  PinsController.swift
//  RefugeeApp
//
//  Created by Ritchelle Posadas on 2017-11-26.
//  Copyright © 2017 Mansoor Shah Said. All rights reserved.
//

import UIKit

class PinsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    view.backgroundColor = UIColor.white
        
    view.addSubview(firstName)
    view.addSubview(imageWoman)
    view.addSubview(howFar)
    view.addSubview(phoneNumber)
    
    setupFirstName()
    setupImageWoman()
    setupHowFar()
    setupPhoneNumber()
        
    }
    
    //FULL NAME
        let firstName: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Jane Doe"
            label.numberOfLines = 0;
            label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.textColor = UIColor(r: 41, g: 199, b: 150)
            label.textAlignment = .center
            
            return label
        }()
    
        func setupFirstName(){
            // need x, y, width, height constraints
            firstName.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
            firstName.heightAnchor.constraint(equalToConstant: 25).isActive = true
            firstName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
            firstName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        }
    
    //PHOTO
        lazy var imageWoman: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Woman")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            
            //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImaveView)))
            
            return imageView
        }()
    
        func setupImageWoman(){
            // need x, y, width, height constraints
            imageWoman.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageWoman.bottomAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 200).isActive = true
            imageWoman.widthAnchor.constraint(equalToConstant: 150).isActive = true
            imageWoman.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
            
    //DISTANCE
        let howFar: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "is x kilometres away."
            label.numberOfLines = 0
            label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = UIColor(r: 41, g: 199, b: 150)
            label.textAlignment = .center
            
            return label
        }()
            
        func setupHowFar(){
            // need x, y, width, height constraints
            howFar.topAnchor.constraint(equalTo: imageWoman.bottomAnchor, constant: 50).isActive = true
            howFar.heightAnchor.constraint(equalToConstant: 25).isActive = true
            howFar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
            howFar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        }
    
    //PHONE NUMBER
        let phoneNumber: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Contact: (514) XXX-XXXX"
            label.numberOfLines = 0
            label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.textColor = UIColor(r: 41, g: 199, b: 150)
            label.textAlignment = .center
            
            return label
        }()
    
        func setupPhoneNumber(){
            // need x, y, width, height constraints
            phoneNumber.topAnchor.constraint(equalTo: howFar.bottomAnchor, constant: 50).isActive = true
            phoneNumber.heightAnchor.constraint(equalToConstant: 25).isActive = true
            phoneNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
            phoneNumber.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        }
        

}
