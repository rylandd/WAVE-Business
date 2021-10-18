//
//  ButtonVIew.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/16/21.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let bg: Color
    let fg: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 20
    
    internal init(title: String,
                  bg: Color = .green,
                  fg: Color = .white,
                  border: Color = .clear,
                  handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.bg = bg
        self.fg = fg
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 50)
        })
            .background(bg)
            .foregroundColor(fg)
            .font(.system(size:16, weight: .bold))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(border, lineWidth: 2)
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            
            ButtonView(title: "Primary Button"){}
            .preview(with: "Primary Button View")
            
            ButtonView(title: "Secondary Button",
                       bg: .clear,
                       fg: .green,
                       border: .green){}
            .preview(with: "Secondary Button View")
        }
        
    }
}
