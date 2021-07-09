//
//  HomeView.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import SwiftUI

struct HomeView: View {
    
    var days = ["Today", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State var showMore = [false, false, false, false, false, false, false]
    
    
    
    var body: some View {
        ZStack {
            Background()
            ScrollView {
                
                VStack {
                    Text("New York City")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .padding(.top, -30)
                    
                    VStack {
                        Text("Rainy Day")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Image(systemName: "cloud.rain.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white)
                            
                        Text("74º")
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                        
                        HStack {
                            Text("H: 82º  L: 57º")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .padding()
                        }
                        .padding(.top, -40)
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(35)
                }
                .padding(.top, 50)
                
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(.white.opacity(0.3))
                    .cornerRadius(20)
                    .padding()
                
                HStack {
                    VStack {
                        Text("Lots of fog and rain, continuing until the morning")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                        Divider()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                VStack {
                                    Text("NOW")
                                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    Image(systemName: "cloud.rain.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30, alignment: .center)
                                        .foregroundColor(.white)
                                    Text("74º")
                                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                                } .padding(8)
                                ForEach(7...12, id: \.self, content: { number in
                                    
                                    let temp = Int.random(in: 68...73)
                                    
                                    VStack {
                                        Text("\(number) PM")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                        if temp == 69 {
                                            Image(systemName: "cloud.drizzle.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30, alignment: .center)
                                                .foregroundColor(.white)
                                        } else {
                                            Image(systemName: "cloud.rain.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30, alignment: .center)
                                                .foregroundColor(.white)
                                        }
                                        Text("\(temp)º")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    } .padding(8)
                                })
                            }
                        }
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(15)
                    .padding(.leading)
                    .padding(.trailing)
                }
                
                VStack {
                    ForEach(days.indices, id: \.self, content: { dayNum in
                        
                        let num = Int.random(in: 0...3)
                        
                        HStack {
                            Text(days[dayNum])
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                            Spacer()
                            Text("75  89  ")
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                            Image(systemName: num != 3 ? "cloud.rain.fill" : "cloud.fill")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                            
                            Button {
                                for index in 0...6 {
                                    if index != dayNum {
                                        showMore[index] = false
                                    }
                                }
                                showMore[dayNum].toggle()
                            } label: {
                                Image(systemName: "chevron.down")
                                    .rotationEffect(showMore[dayNum] ? .degrees(180) : .degrees(0))
                                    .animation(.default)
                            }
                        }
                        if showMore[dayNum] {
                            VStack {
                                ForEach(8...12, id: \.self, content: { theTime in
                                    let temp = Int.random(in: 75...89)
                                    HStack {
                                        Text("\(theTime) AM")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                        Spacer()
                                        Image(systemName: num != 3 ? "cloud.rain.fill" : "cloud.fill")
                                        Text("\(temp)")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    } .padding(3)
                                    Divider()
                                })
                                
                                ForEach(1...8, id: \.self, content: { theTime in
                                    let temp = Int.random(in: 75...89)
                                    HStack {
                                        Text("\(theTime) PM")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                        Spacer()
                                        Image(systemName: num != 3 ? "cloud.rain.fill" : "cloud.fill")
                                        Text("\(temp)")
                                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    } .padding(3)
                                    if theTime != 8 {
                                        Divider()
                                    }
                                })

                            }
                            .padding(8)
                            .animation(.default, value: 10)
                        }
                        
                        if days[dayNum] != "Sunday" {
                            Divider()
                        }
                    })
                }
                .padding(.leading)
                .padding(.trailing)
                .padding()
                .background(.regularMaterial)
                .cornerRadius(15)
                .padding()
                
            }
            .shadow(radius: 40)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
