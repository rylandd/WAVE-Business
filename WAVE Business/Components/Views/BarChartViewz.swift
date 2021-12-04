//
//  BarChartViewz.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 12/4/21.
//

import SwiftUI
import SwiftUICharts

struct BarChartViewz: View {
    
    let customers = Legend(color: .green, label: "Customers")
    
    let age21 = Legend(color: .blue, label: "21")
    let age22 = Legend(color: .red, label: "22")
    let age23 = Legend(color: .yellow, label: "23")
    let age24 = Legend(color: .green, label: "24")
    let age25 = Legend(color: .orange, label: "25")
    let age26 = Legend(color: .purple, label: "26")
    
    var body: some View {

        VStack{
            
            let points: [DataPoint] = [
                .init(value: 17, label: "9PM", legend: customers),
                .init(value: 35, label: "10PM", legend: customers),
                .init(value: 56, label: "11PM", legend: customers),
                .init(value: 80, label: "12AM", legend: customers),
                .init(value: 49, label: "1AM", legend: customers),
                .init(value: 43, label: "2AM", legend: customers)
                ]
            
            let age: [DataPoint] = [
                .init(value: 40, label: "21", legend: age21),
                .init(value: 50, label: "22", legend: age22),
                .init(value: 34, label: "23", legend: age23),
                .init(value: 22, label: "24", legend: age24),
                .init(value: 19, label: "25", legend: age25),
                .init(value: 3, label: "26", legend: age26)
            ]
            
            Section(header: Text("Expected Customers")){
                BarChartView(dataPoints: points)
                    .frame(height: UIScreen.main.bounds.size.height/4)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .foregroundColor(.black)
            }.foregroundColor(.white)
            Section(header: Text("Age Demographics")){
                LineChartView(dataPoints: age)
                    .frame(height: UIScreen.main.bounds.size.height/4)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .foregroundColor(.black)
            }.foregroundColor(.white)
        }
        
    }
}

struct BarChartViewz_Previews: PreviewProvider {
    static var previews: some View {
        BarChartViewz()
    }
}
