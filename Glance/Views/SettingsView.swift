//
//  SettingsView.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import SwiftUI

struct SettingsView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .white
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
                                Image(systemName: "iphone.circle.fill")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 25, height: 25, alignment: .center)
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
                                Image(systemName: "location.circle.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 25, height: 25, alignment: .center)
                                Text("Location")
                                    .foregroundColor(.pink)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 25, height: 25, alignment: .center)
                        Link("Support the Dev", destination: URL(string:"https://www.buymeacoffee.com/luckdev")!)
                            .foregroundColor(.pink)
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
    }
}


