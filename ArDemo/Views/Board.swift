//
//  Board.swift
//  ArDemo
//
//  Created by 金小鱼 on 2021/7/30.
//

import SwiftUI


struct Board: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("SPORTS BOARD")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)
                HStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Schedule Board")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            ForEach(1..<10) { idx in
                                HStack {
                                    Text("ScheduleList\(idx)")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                .padding()
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Ranking Board")
                                .font(.title)
                            
                            ForEach(1..<10) {idx in
                                HStack {
                                    Text("Ranking Info\(idx)")
                                    Spacer()
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                .padding()
                            }
                        }
                        .padding()
                    }
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(1..<20) { idx in
                                Support(message: "Support Message \(idx)", userName: "@User \(idx)")
                            }
                        }
                    }
                }
                
                NavigationLink(destination: NewSupport()) {
                    Text("Show My Support")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color.black.opacity(0.8)))
                }
            }
        }
        .padding(.all, 0)
        .background(Color.gray.opacity(0.8))
    }
}


struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Board()
                .padding()
        }
    }
}
