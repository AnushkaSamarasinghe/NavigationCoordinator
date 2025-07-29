//
//  iPadSignInView.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//


import SwiftUI

struct iPadSignInView: View {
    
    @Environment(\.navigationCoordinator) var coordinator: NavigationCoordinator
    
    var body: some View {
        Text("Hello, SignIn with in iPad!")
        
        CommonButton(title: "Sign In", isFilled: true, isFullWidth: false) {
            coordinator.push(page: .home)
        }
    }
}
