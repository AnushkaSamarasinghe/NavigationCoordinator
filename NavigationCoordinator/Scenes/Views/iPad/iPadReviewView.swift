//
//  iPadReviewView.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//


import SwiftUI

struct iPadReviewView: View {
    
    @Environment(\.navigationCoordinator) var coordinator: NavigationCoordinator
    
    var body: some View {
        List {
            Button("Pop") {
                coordinator.popCover()
            }
        }
        .navigationTitle("Review View on iPad!")
    }
}
