//
//  AnalyticsView.swift
//  WAVE Business
//
//  Created by William Hinson on 12/3/21.
//

import Foundation
import UIKit
import SwiftUI
import SwiftUICharts

struct AnalyticsView : View {
    
    let customers1 = Legend(color: .green, label: "Monday")
    let customers2 = Legend(color: .blue, label: "Tuesday")
    let customers3 = Legend(color: .yellow, label: "Wednesday")
    let customers4 = Legend(color: .black, label: "Thursday")
    let customers5 = Legend(color: .purple, label: "Friday")
    let customers6 = Legend(color: .orange, label: "Saturday")
    let customers7 = Legend(color: .pink, label: "Sunday")
    
    var body: some View {
        
        ZStack {
            Image("Rectangle")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Image("logo")
                    .frame(width: 228, height: 183, alignment: Alignment.center)
                Spacer()
                
                let points: [DataPoint] = [
                    .init(value: 31, label: "Mon", legend: customers1),
                    .init(value: 120, label: "Tue", legend: customers2),
                    .init(value: 74, label: "Wed", legend: customers3),
                    .init(value: 80, label: "Thu", legend: customers4),
                    .init(value: 221, label: "Fri", legend: customers5),
                    .init(value: 263, label: "Sat", legend: customers6),
                    .init(value: 119, label: "Sun", legend: customers7)
                    ]
                
                Section(header: Text("Busiest days")){
                    BarChartView(dataPoints: points)
                        .frame(height: UIScreen.main.bounds.size.height/2)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .foregroundColor(.black)
                }.foregroundColor(.white)
                
                Spacer()
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
