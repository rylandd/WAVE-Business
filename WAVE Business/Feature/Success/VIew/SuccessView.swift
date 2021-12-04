//
//  SuccessView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import SwiftUI

struct SuccessView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    @State private var isShowing = false
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
            //UINavigationBar.appearance().backgroundColor = .green
        
        //UINavigationBar.appearance().barTintColor = UIColor(red: 9/255, green: 17/255, blue: 28/255, alpha: 1.0)
        
            //Use this if NavigationBarTitle is with displayMode = .inline
            //UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        }
    
    var body: some View {
            
            ZStack{
                if isShowing{
                    SideMenuView(isShowing: $isShowing)
                }
               
                    DashboardView()
                        //.cornerRadius(isShowing ? 20 : 0)
                        .offset(x: isShowing ? 300 : 0, y: 0)
                        .scaleEffect(isShowing ? 0.8 : 1)
                        .environmentObject(sessionService)
                        .navigationBarItems(leading: Button(action: {
                            withAnimation(.spring()){
                                isShowing.toggle()
                            }
                        }, label: {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.gray)
                        }))
                        .navigationTitle("Dashboard")
                
                
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

struct DashboardView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {

        ZStack{
            
            Color(red: 9/255, green: 17/255, blue: 28/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16){
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")").foregroundColor(Color.white)
                    Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                        .foregroundColor(Color.white)
                    Text("Bar Name: \(sessionService.userDetails?.barName ?? "N/A")")
                        .foregroundColor(Color.white)
                    Spacer()
                    BarChartViewz()
                }
                
                /*
                ButtonView(title: "Sign Out"){
                    // sign out view
                    sessionService.logout()
                }
                 */
                 
            }
             
        }
        
    }
}
