//
//  HomeVM.swift
//  Xpensify
//
//  Created by Muhammad Suleman on 5/14/23.
//

import Foundation

class HomeVM: ObservableObject {
    
    let sidebarItems: [SidebarItem] = [
        .init(icon: "calendar.badge.plus", name: "Operations"),
        .init(icon: "list.bullet.rectangle.fill", name: "Transections"),
        .init(icon: "chart.bar.fill", name: "Reports"),
        .init(icon: "gearshape.fill", name: "Settings"),
        .init(icon: "person.crop.rectangle.fill", name: "Account")
    ]
    
}
