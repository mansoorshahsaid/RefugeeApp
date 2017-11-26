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
    
    init(user:UserInfo) {
        fireBaseUser = user
        id = user.uid
    }
}
