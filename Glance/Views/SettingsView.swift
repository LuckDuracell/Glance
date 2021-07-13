//
//  SettingsView.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    init() {
        UITableView.appearance().backgroundColor = .clear
        if colorScheme == .dark {
            UITableViewCell.appearance().backgroundColor = .orange
            UITabBar.appearance().backgroundColor = UIColor.systemGray4
        } else {
            UITableViewCell.appearance().backgroundColor = .white
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    }
    
    @State var page1 = false
    @State var page2 = false
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                List {
                    VStack {
                        Button {
                            withAnimation {
                                page1 = true
                            }
                        } label: {
                            HStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .foregroundColor(.white)
                                    Image(systemName: "iphone.circle.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 25, height: 25, alignment: .center)
                                }
                                Text("Display")
                                    .foregroundColor(.pink)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    VStack {
                        Button {
                            withAnimation {
                                page2 = true
                            }
                        } label: {
                            HStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .foregroundColor(.white)
                                    Image(systemName: "location.circle.fill")
                                        .resizable()
                                        .foregroundColor(.blue)
                                        .frame(width: 25, height: 25, alignment: .center)
                                }
                                Text("Location")
                                    .foregroundColor(.pink)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 24, height: 24, alignment: .center)
                                .foregroundColor(.white)
                            Image(systemName: "dollarsign.circle.fill")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 25, height: 25, alignment: .center)
                        }
                        Link("Support the Dev", destination: URL(string:"https://www.buymeacoffee.com/luckdev")!)
                            .foregroundColor(.pink)
                    }
                    
                    HStack {
                        Button {
                            UITableView.appearance().backgroundColor = .clear
                            if colorScheme == .dark {
                                UITableViewCell.appearance().backgroundColor = .orange
                                UITabBar.appearance().backgroundColor = UIColor.systemGray4
                            } else {
                                UITableViewCell.appearance().backgroundColor = .white
                                UITabBar.appearance().backgroundColor = UIColor.white
                            }
                        } label: {
                            HStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .foregroundColor(.white)
                                    Image(systemName: "list.bullet.circle.fill")
                                        .resizable()
                                        .foregroundColor(.yellow)
                                        .frame(width: 25, height: 25, alignment: .center)
                                }
                                Text("Update Colors")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    
                } .frame(height: 300)
                .padding(.top, 30)
                Spacer()
            }
            if page1 {
                DisplaySettings()
                    .transition(.move(edge: .trailing))
                    //.shadow(radius: 15)
            }
            if page2 {
                LocationSettings()
                    .transition(.move(edge: .trailing))
                    //.shadow(radius: 15)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environment(\.colorScheme, .dark)
    }
}


