//
//  Coordinator.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//

import SwiftUI

enum NavigationCoordinatorDestination: Hashable, View {
    case signin
    case home
    case detail(detail: String)
    
    var body: some View {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad: iPadView
        case .phone: iPhoneView
        default: AnyView(Text(verbatim: "App Is Crashed"))
        }
    }
    
    @ViewBuilder
    private var iPhoneView: some View {
        switch self {
        case .signin:
            iPhoneSignInView()
        case .home:
            iPhoneHomeView()
        case .detail(let detail):
            iPhoneDeatilView(vm: DetailVM(detail: detail))
        }
    }
    
    @ViewBuilder
    private var iPadView: some View {
        switch self {
        case .signin:
            iPadSignInView()
        case .home:
            iPadHomeView()
        case .detail(let detail):
            iPadDeatilView(vm: DetailVM(detail: detail))
        }
    }
    
}

enum NavigationCoordinatorSheet: String, Identifiable, View {
    var id: String { self.rawValue }
    
    case reviewSheet
    
    
    var body: some View {
        switch self {
        case .reviewSheet:
            iPhoneReviewView()
        }
    }
}

enum NavigationCoordinatorCover: String, Identifiable, View {
    var id: String { self.rawValue }
    
    case reviewCover
    
    var body: some View {
        switch self {
        case .reviewCover:
            iPadReviewView()
        }
    }
}

@Observable
class NavigationCoordinator {
    var pathInNavigation: NavigationPath = NavigationPath()
    var sheet: NavigationCoordinatorSheet?
    var cover: NavigationCoordinatorCover?
    var data: Any?
    
    static let shared = NavigationCoordinator()
    init() {}
    
    func push(page: NavigationCoordinatorDestination, _ data: Any? = nil) {
        pathInNavigation.append(page)
        self.data = data
    }
    
    func pop(_ last: Int = 1, _ data: Any? = nil) {
        pathInNavigation.removeLast(last)
        self.data = data
    }
    
    func popToRoot() {
        pathInNavigation.removeLast(pathInNavigation.count)
    }
    
    func present(sheet: NavigationCoordinatorSheet, _ data: Any? = nil) {
        self.sheet = sheet
        self.data = data
    }
    
    func present(cover: NavigationCoordinatorCover, _ data: Any? = nil) {
        self.cover = cover
        self.data = data
    }
    
    func popSheet() {
        self.sheet = nil
    }
    
    func popCover() {
        self.cover = nil
    }
}

extension EnvironmentValues {
    @Entry var navigationCoordinator = NavigationCoordinator()
}

struct NavigationCoordinatorView: View {
    @State private var coordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.pathInNavigation) {
            NavigationCoordinatorDestination.signin
                .navigationDestination(for: NavigationCoordinatorDestination.self) { $0 }
                .sheet(item: $coordinator.sheet) { $0 }
                .fullScreenCover(item: $coordinator.cover) { $0 }
                .navigationBarBackButtonHidden(true)
        }
        .environment(\.navigationCoordinator, coordinator)
    }
}

#Preview {
    iPhoneSignInView()
}
