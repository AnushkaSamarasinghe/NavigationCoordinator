//
//  iPhoneHomeView.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//


import SwiftUI

struct iPhoneHomeView: View {
    
    @Environment(\.navigationCoordinator) var coordinator: NavigationCoordinator
    @Bindable var vm = HomeVM()
    
    var body: some View {
        VStack(alignment: .center, spacing: 26){
            Text ("Click on button to generate Random Number and send it to Detail view")
                .font(.headline)
                .padding()
            
            Text("Random Number is: \(vm.randomNumber)")
            
            CommonButton(title: "Generate A Number", isFilled: true, isFullWidth: true) {
                coordinator.push(page: .detail(detail: "Random number is: \(vm.randomNumber)"))
            }
        }//: VStack
        .onAppear() { vm.randomNumber = Int.random(in: 1...100) }
        .padding(.horizontal, 10)
        .navigationTitle(Text("Home on iPhone"))
    }
}
