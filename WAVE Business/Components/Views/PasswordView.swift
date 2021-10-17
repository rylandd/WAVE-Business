//
//  PasswordView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/16/21.
//

import SwiftUI

struct PasswordView: View {
    
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 35
    
    var body: some View {
        
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity,
                   minHeight: 45)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 :
                textFieldLeading)
            .background(
                
                ZStack(alignment: .leading) {
                    
                    if let systemImage = sfSymbol {
                        
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.gray.opacity(1))
                    }
                    RoundedRectangle(cornerRadius: 30,
                                     style: .continuous)
                        .stroke(Color.gray.opacity(1))
                }
            )
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            
            PasswordView(password: .constant(""),
                         placeholder: "Password",
                         sfSymbol: "lock")
                .preview(with: "Input Password View With symbol")
            
            PasswordView(password: .constant(""),
                         placeholder: "Password",
                         sfSymbol: nil)
                .preview(with: "Input Password View Without symbol")
        }
        
    }
}
