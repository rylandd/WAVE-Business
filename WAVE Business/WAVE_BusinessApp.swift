//
//  WAVE_BusinessApp.swift
//  WAVE Business
//
//  Created by Ryland Dreibelbis on 10/13/21.
//
// new commit for an update

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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
