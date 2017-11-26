//
//  VictoryController.swift
//  RefugeeApp
//
//  Created by Ritchelle Posadas on 2017-11-26.
//  Copyright © 2017 Mansoor Shah Said. All rights reserved.
//

import UIKit

class VictoryController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.addSubview(codeMessage)
        view.addSubview(identifierMessage)
        
        setupCodeMessage()
        setupIdentifierMessage()
    }
    
    let codeMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your unique identifier is"
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        
        return label
    }()

    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    let identifierMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "123553463427457"
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        
        return label
    }()
    
    func setupCodeMessage(){
        // need x, y, width, height constraints
        //registerMessage.translatesAutoresizingMaskIntoConstraints = false
        codeMessage.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        codeMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        codeMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        codeMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
   
    func setupIdentifierMessage(){
        // need x, y, width, height constraints
        //registerMessage.translatesAutoresizingMaskIntoConstraints = false
        identifierMessage.topAnchor.constraint(equalTo: codeMessage.bottomAnchor, constant: 20).isActive = true
        identifierMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        identifierMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        identifierMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
}
