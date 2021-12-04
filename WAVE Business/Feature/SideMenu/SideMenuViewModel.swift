//
//  SideMenuViewModel.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 12/4/21.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case dashboard
    case analytics
    case ads
    
    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .analytics: return "Analytics"
        case .ads: return "Create an Ad"
        }
    }
}


