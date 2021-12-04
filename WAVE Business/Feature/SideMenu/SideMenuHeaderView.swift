//
//  SideMenuHeaderView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 12/4/21.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            Button(action: { withAnimation(.spring()){
                isShowing.toggle()
            }}, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .padding([.leading, .bottom], 10)
                
                Text("WAVE")
                    .font(.system(size:24, weight: .semibold))
                
                Text("For Bar Owners")
                    .font(.system(size:14))
                HStack{
                    
                    Spacer()
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        .padding()
        }
        
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
