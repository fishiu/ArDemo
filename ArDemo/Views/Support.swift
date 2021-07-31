//
//  Support.swift
//  ArDemo
//
//  Created by 金小鱼 on 2021/7/31.
//

import SwiftUI

struct Support: View {
    var message: String
    var userName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.yellow)
                    .padding([.top, .leading])
                
                Text(userName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding([.top, .trailing])
            }
            
                
            Text(message)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
                
        }
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.blue.opacity(0.5)).shadow(radius: 3))
    }
}

struct Support_Previews: PreviewProvider {
    static var previews: some View {
        Support(message: "Support Long Message 1", userName: "User 1")
    }
}
