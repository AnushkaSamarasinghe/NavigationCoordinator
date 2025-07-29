//
//  iPhoneReviewView.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//


import SwiftUI

struct iPhoneReviewView: View {
    
    @Environment(\.navigationCoordinator) var coordinator: NavigationCoordinator
    
    var body: some View {
        List {
            Button("Pop") {
                coordinator.popSheet()
            }
        }
        .navigationTitle("Review View on iPhone!")
    }
}
