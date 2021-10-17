//
//  WAVE_BusinessApp.swift
//  WAVE Business
//
//  Created by Ryland Dreibelbis on 10/13/21.
//

import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey:
                                                                    Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
        
    }
}

@main
struct WAVE_BusinessApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionServiceImpl()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            NavigationView {
                switch sessionService.state {
                case .loggedIn:
                    SuccessView()
                        .environmentObject(sessionService)
                case .loggedOut:
                    LoginVIew()
                }
                //LoginVIew()
                
            }
        }
    }
}
