//
//  AnalyticsView.swift
//  WAVE Business
//
//  Created by William Hinson on 12/3/21.
//

import Foundation
import UIKit
import SwiftUI

struct AnalyticsView : View {
    
    
    var body: some View {
        
        ZStack {
            Image("Rectangle")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Image("logo")
                    .frame(width: 228, height: 183, alignment: Alignment.center)
                
                
            }
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnalyticsView()
        }
        
    }
}
