//
//  Background.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import Foundation
import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
            .overlay(
                    Color.white.opacity(0.3)
                )
            .edgesIgnoringSafeArea(.all)
    }
}
