//
//  ContentView.swift
//  Xpens Manager
//
//  Created by Muhammad Suleman on 4/25/23.
//

import SwiftUI

struct SidebarItem: Hashable {
    let icon: String
    let name: String
}



struct ContentView: View {
    
    let sidebarItems: [SidebarItem] = [
        .init(icon: "house.fill", name: "Home"),
        .init(icon: "list.bullet.rectangle.fill", name: "Transections"),
        .init(icon: "chart.bar.fill", name: "Reports"),
        .init(icon: "gearshape.fill", name: "Settings"),
        .init(icon: "person.crop.rectangle.fill", name: "Account")
    ]
    @State var selectedItem = "Home"
    
    var body: some View {
        HStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                sidebarView()
            }
            .frame(minWidth: 200, maxWidth: 200, maxHeight: .infinity)
            .background(Color.blue)
            
            //MARK: Detailed View
            VStack {
                Text("Welcome 🙂")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .tracking(2)
                    .padding(40)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 4)
            }
            .frame(minWidth: 600, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
            .background(Color.white)//.opacity(0.8))
            .foregroundColor(.black)
        }
    }
    
    //MARK: Sidebar
    @ViewBuilder func sidebarView() -> some View {
        ScrollView {
            VStack(spacing: 10) {
                
                VStack(spacing: 10) {
                    Image("XpensifyLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Text("Xpensify")
                        .font(.title)
                }
                .padding(.top, 32)
                
                Capsule(style: .circular)
                    .frame(maxWidth: 200, maxHeight: 2)
                    .padding(.vertical)
                
                ForEach(sidebarItems, id: \.self) { item in
                    HStack(spacing: 8) {
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .clipShape(Rectangle())
                        Text(item.name)
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(selectedItem == item.name ? Color.orange:.blue)
                    .foregroundColor(.white)
                    .onTapGesture{withAnimation{ selectedItem = item.name }}
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
