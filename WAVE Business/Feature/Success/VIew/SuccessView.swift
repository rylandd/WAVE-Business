//
//  SuccessView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            
            VStack(alignment: .leading, spacing: 16){
                
                Text("First Name: <from firebase>")
                Text("Last Name: <from firebase>")
                Text("Bar Name: <from firebase>")
                
            }
            ButtonView(title: "Sign Out"){
                // sign out view
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SuccessView()
        }
    }
}
