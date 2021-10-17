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
        VStack(alignment: .leading, spacing: 16){
            
            VStack(alignment: .leading, spacing: 16){
                
                Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                Text("Bar Name: \(sessionService.userDetails?.barName ?? "N/A")")
                
            }
            ButtonView(title: "Sign Out"){
                // sign out view
                sessionService.logout()
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
