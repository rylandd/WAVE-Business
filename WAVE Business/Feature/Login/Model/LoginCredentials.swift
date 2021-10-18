//
//  LoginCredentials.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    static var new: LoginCredentials {
        LoginCredentials(email: "",
                         password: "")
    }
}
