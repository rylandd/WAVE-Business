//
//  LoginVIew.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/16/21.
//

import SwiftUI

struct LoginVIew: View {
    var body: some View {
        
        ZStack{
            Image("WaveBG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 250)
                        
            
            VStack(){
                Text("WAVE")
                    .font(.system(size: 72, weight: .thin, design: .default))
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text("For Bar Owners")
                    .font(.system(size: 18, weight: .light, design: .default))
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    
                VStack(spacing: 16){
                    
                    InputView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                        
                    
                    PasswordView(password: .constant(""), placeholder: "Password", sfSymbol: "lock")
                    
                }
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        // forgot password view
                    }, label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color(hue: 0.607, saturation: 0.857, brightness: 0.773))
                            .padding(.trailing)
                    })
                        .font(.system(size: 16, weight: .bold))
                }
                
                
                VStack(spacing: 18){
                    
                    ButtonView(title: "Login"){
                        
                        // login view
                    }
                    ButtonView(title: "Sign-Up",
                               bg: .clear,
                               fg: .black,
                               border: .white){
                        
                        //Sign-Up view
                    }
                }
                
                
                
                Spacer()
            }
           
                
                
            
           
        }
    }
}

struct LoginVIew_Previews: PreviewProvider {
    static var previews: some View {
        LoginVIew()
    }
}
