//
//  ForgotPasswordView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 16){
                
                InputView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                
                ButtonView(title: "Reset Password"){
                    // send password reset info
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Reset Password")
            .applyClose()
        }
        
    }
}

struct ForgotPasswordVIew_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
