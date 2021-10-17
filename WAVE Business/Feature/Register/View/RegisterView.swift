//
//  RegisterView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var vm = RegistrationViewModelImpl(
        service: RegistrationServiceImpl()
    )
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 32) {
                
                VStack(spacing: 16){
                    
                    InputView(text: $vm.userDetails.email,
                              placeholder: "Email",
                              keyboardType: .emailAddress,
                              sfSymbol: "envelope")
                    PasswordView(password: $vm.userDetails.password,
                                 placeholder: "Password",
                                 sfSymbol: "lock")
                    Divider()
                    
                    InputView(text: $vm.userDetails.firstName,
                              placeholder: "First Name",
                              keyboardType: .namePhonePad,
                              sfSymbol: nil)
                    InputView(text: $vm.userDetails.lastName,
                              placeholder: "Last Name",
                              keyboardType: .namePhonePad,
                              sfSymbol: nil)
                    InputView(text: $vm.userDetails.barName,
                              placeholder: "Bar Name",
                              keyboardType: .namePhonePad,
                              sfSymbol: nil)
                }
                
                ButtonView(title: "Sign up"){
                    // sign up user
                    vm.register()
                }
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Sign-Up")
            .applyClose()
            .alert(isPresented: $vm.hasError,
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
