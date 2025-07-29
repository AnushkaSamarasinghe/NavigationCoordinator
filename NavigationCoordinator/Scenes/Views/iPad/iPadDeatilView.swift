//
//  iPadDeatilView.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//


import SwiftUI

struct iPadDeatilView: View {
    
    @Environment(\.navigationCoordinator) var coordinator: NavigationCoordinator
    @Bindable var vm: DetailVM
    
    var body: some View {
        VStack{
            Text(vm.details)
            
            CommonButton(title: "Review Cover", isFilled: true, isFullWidth: false) {
                coordinator.present(cover: .reviewCover)
            }
            
            CommonButton(title: "Change Text", isFilled: false, isFullWidth: false) {
                vm.details = "New value"
            }
        }//: VStack
    }
}
