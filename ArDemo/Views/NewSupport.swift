//
//  NewSupport.swift
//  ArDemo
//
//  Created by 金小鱼 on 2021/7/31.
//

import SwiftUI

struct NewSupport: View {
    @State var TextValue = ""
    @State var PlaceHolderText = "Say Something"
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.yellow)
                    .padding()
                Text("@User 1")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.vertical)
                Spacer()
                Text("POST!")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                    )
                    
            }
            .padding()
            
            
            
            ZStack {
                if self.TextValue.isEmpty {
                        TextEditor(text: $PlaceHolderText)
                            .font(.custom("Helvetica", size: 24))
                            .foregroundColor(.gray)
                            .disabled(true)
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 30))
                }
                TextEditor(text: $TextValue)
                    .font(.custom("Helvetica", size: 24))
                    .opacity(self.TextValue.isEmpty ? 0.25 : 1)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 30))
                    .keyboardType(.default)
            }
        }
    }
}

struct NewSupport_Previews: PreviewProvider {
    static var previews: some View {
        NewSupport()
    }
}
