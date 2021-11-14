//
//  InputView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/16/21.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 35
    private let textColor = Color.white
    
    var body: some View {
        
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity,
            minHeight: 45)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
            .keyboardType(keyboardType)
           // .foregroundColor(textColor)
            .background(
                
                ZStack(alignment: .leading){
                    if let systemImage = sfSymbol {
                        
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading,5)
                            .foregroundColor(Color.white.opacity(1))
                    }
                    RoundedRectangle(cornerRadius: 30,
                                     style: .continuous)
                        .stroke(Color.gray.opacity(1))
                }
            )
            

    }
    
}


struct InputView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            InputView(text: .constant(""),
                      placeholder: "Email",
                      keyboardType: .emailAddress,
                      sfSymbol: "envelope"
            ).preview(with: "Text Input with symbol")
            
            
            InputView(text: .constant(""),
                      placeholder: "FIrst Name",
                      keyboardType: .default,
                      sfSymbol: nil
            ).preview(with: "First Name Text Input with symbol")
        }
        
        
    }
}
