//
//  DeatilVM.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//

import Foundation
import Observation

@Observable
final class DetailVM {
    var title: String = "Details"
    
    var details: String = ""
    var dataAction: (() -> ())?
    
    init(detail: String) {
        self.details = detail
    }
}
