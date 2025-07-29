//
//  iPhoneSignInView.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//


import SwiftUI

struct iPhoneSignInView: View {
    
    @Environment(\.navigationCoordinator) var coordinator: NavigationCoordinator
    
    var body: some View {
        Text("Hello, SignIn with in iPhone!")
        
        CommonButton(title: "Sign In", isFilled: true, isFullWidth: false) {
            coordinator.push(page: .home)
        }
    }
}
