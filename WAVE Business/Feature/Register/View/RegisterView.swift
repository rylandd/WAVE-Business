//
//  RegisterView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import SwiftUI

struct RegisterView: View {
    
    
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 32) {
                
                VStack(spacing: 16){
                    
                    InputView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                    PasswordView(password: .constant(""), placeholder: "Password", sfSymbol: "lock")
                    Divider()
                    
                    InputView(text: .constant(""), placeholder: "First Name", keyboardType: .namePhonePad, sfSymbol: nil)
                    InputView(text: .constant(""), placeholder: "Last Name", keyboardType: .namePhonePad, sfSymbol: nil)
                    InputView(text: .constant(""), placeholder: "Bar Name", keyboardType: .namePhonePad, sfSymbol: nil)
                }
                
                ButtonView(title: "Sign up"){
                    // sign up user
                }
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Sign-Up")
            .applyClose()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
