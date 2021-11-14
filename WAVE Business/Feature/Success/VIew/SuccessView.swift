//
//  SuccessView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import SwiftUI

struct SuccessView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        
        ZStack{
            
            Color(red: 9/255, green: 17/255, blue: 28/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16){
                
                Image("logo")
                Spacer()
                
                VStack(alignment: .leading, spacing: 16){
                    
                    
                    Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")").foregroundColor(Color.white)
                    Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                        .foregroundColor(Color.white)
                    Text("Bar Name: \(sessionService.userDetails?.barName ?? "N/A")")
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                ButtonView(title: "Sign Out"){
                    // sign out view
                    sessionService.logout()
                }
            }
        }
        
        
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SuccessView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
