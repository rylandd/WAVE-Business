//
//  SideMenuView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 12/4/21.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    func signout(){
        sessionService.logout()
    }
    
    @Binding var isShowing: Bool
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.green]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                //Header
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 240)
                
                //Options
                
                ForEach(SideMenuViewModel.allCases, id: \.self){ option in
                
                
                    NavigationLink(
                        destination: Text(option.title),
                    label: {
                        SideMenuOptionView(viewModel: option)
                    })
                }
                
                
                Spacer()
                HStack{
                    Button("Logout"){
                        sessionService.logout()
                    }
                    .foregroundColor(.white)
                    .padding()
                    
                    Spacer()
                }
            
                
                
            }
        }.navigationBarHidden(true)
    }
        
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
