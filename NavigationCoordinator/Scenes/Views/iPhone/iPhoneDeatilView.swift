//
//  iPhoneDeatilView.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//


import SwiftUI

struct iPhoneDeatilView: View {
    
    @Environment(\.navigationCoordinator) var coordinator: NavigationCoordinator
    @Bindable var vm: DetailVM
    
    var body: some View {
        VStack{
            Text(vm.details)
            
            CommonButton(title: "Review Sheet", isFilled: true, isFullWidth: false) {
                coordinator.present(sheet: .reviewSheet)
            }
            
            CommonButton(title: "Change Text", isFilled: false, isFullWidth: false) {
                vm.details = "New value"
            }
        }//: VStack
    }
}
