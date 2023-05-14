//
//  ContentView.swift
//  Xpens Manager
//
//  Created by Muhammad Suleman on 4/25/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeVM()
    @State var selectedItem = "Operations"
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) { sidebarView() }
            .frame(minWidth: 250, maxWidth: 250,
                   maxHeight: .infinity)
            .background(sidebarBGColor)
            
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
            .frame(minWidth: 800, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
            .background(Color.white)
            .foregroundColor(.black)
        }
    }
}

//MARK: Sidebar
extension HomeView {
    @ViewBuilder func sidebarView() -> some View {
        ScrollView {
            VStack(spacing: 10) {
                
                VStack(spacing: 10) {
                    Image("XpensifyLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .rotationEffect(.degrees(90))
                    Text("Xpensify")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .tracking(1)
                }
                .padding(.top, 32)
                
                Capsule(style: .circular)
                    .frame(maxWidth: 250, maxHeight: 2)
                    .padding(.vertical)
                
                ForEach(homeVM.sidebarItems, id: \.self) { item in
                    HStack(spacing: 14) {
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 30)
                            .clipShape(Rectangle())
                        Text(item.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .tracking(1.5)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.leading, 10)
                    .padding(.vertical, 10)
                    .background(selectedItem == item.name ? Color.orange:sidebarBGColor)
                    .foregroundColor(.white)
                    .onTapGesture{withAnimation{ selectedItem = item.name }}
                }
            }
        }
    }
    
}


//MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
