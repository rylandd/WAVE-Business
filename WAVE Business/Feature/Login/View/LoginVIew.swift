//
//  LoginVIew.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/16/21.
//

import SwiftUI

struct LoginVIew: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View {
        
        ZStack{
            Image("Rectangle")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        
            
            VStack(){
                /*
                
                 */
                Text("WAVE")
                    .font(.system(size: 72, weight: .thin, design: .default))
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text("For Bar Owners")
                    .font(.system(size: 18, weight: .light, design: .default))
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                Image("logo")
               
                    
                    
                VStack(spacing: 16){
                    
                    InputView(text: $vm.credentials.email,
                              placeholder: "Email",
                              keyboardType: .emailAddress,
                              sfSymbol: "envelope")
                        
                    
                    PasswordView(password: $vm.credentials.password,
                                 placeholder: "Password",
                                 sfSymbol: "lock")
                    
                }
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        //---------------------------
                        // forgot password view
                        //---------------------------
                        showForgotPassword.toggle()
                    }, label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color .green)
                            .padding(.trailing)
                    })
                        .font(.system(size: 16, weight: .bold))
                        .sheet(isPresented: $showForgotPassword,
                               content: {
                            ForgotPasswordView()
                        })
                }
                
                
                VStack(spacing: 18){
                    
                    ButtonView(title: "Login"){
                        //---------------------------
                        // login view
                        //---------------------------
                        vm.login()
                    }
                    ButtonView(title: "Sign-Up",
                               bg: .clear,
                               fg: .white,
                               border: .green){
                        
                        //---------------------------
                        //Sign-Up view
                        //---------------------------
                        showRegistration.toggle()
                    }
                    .sheet(isPresented: $showRegistration, content: {
                                   RegisterView()
                               })
                }
                
                
                Spacer()
            }
           
                
                
            
           
        }.alert(isPresented: $vm.hasError,
                content: {
            
            if case .failed(let error) = vm.state {
                return Alert(title: Text("Error"),
                             message: Text(error.localizedDescription))
            } else {
                return Alert(title: Text("Error"),
                             message: Text("Something went Wrong"))
            }
        })
    }
}

struct LoginVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LoginVIew()
        }
    }
}
