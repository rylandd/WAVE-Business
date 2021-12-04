//
//  SideMenuOptionView.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 12/4/21.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            
            Text(viewModel.title)
                .font(.system(size: 18, weight: .semibold))
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .dashboard)
    }
}
