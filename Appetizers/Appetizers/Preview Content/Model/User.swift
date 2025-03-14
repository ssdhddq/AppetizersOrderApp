//
//  User.swift
//  Appetizers
//
//  Created by SSDHDDQ on 12.03.2025.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
} 

