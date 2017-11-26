//
//  User.swift
//  RefugeeApp
//
//  Created by Mansoor Shah Said on 2017-11-25.
//  Copyright © 2017 Mansoor Shah Said. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class User:NSObject{
    var id:String!
    var fireBaseUser:UserInfo
    var email:String!
    var gender:String!
    var firstName:String!
    var lastName:String!
    var dateOfBirth:String!
    var countryOfOrigin:String!
    var profession:String!
    var employee:Bool!
    var verified:Bool!
    var dictonary:[String:Any]!

    
    init(user:UserInfo, dictionary:[String:Any]) {
        fireBaseUser = user
        id = user.uid
        email = user.email
        gender = dictionary["gender"] as! String
        firstName = dictionary["firstName"] as! String
        lastName = dictionary["lastName"] as! String
        dateOfBirth = dictionary["dateOfBirth"] as! String
        countryOfOrigin = dictionary["countryOfOrigin"] as! String
        profession = dictionary["profession"] as! String
        employee = dictionary["employee"] as! Bool
        verified = dictionary["verify"] as! Bool
    }
}
