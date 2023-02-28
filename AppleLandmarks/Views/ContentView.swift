//
//  ContentView.swift
//  AppleLandmarks
//
//  Created by BinYu on 28/2/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tabType: TabType = .featured
    enum TabType {
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $tabType) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(TabType.featured)
            
            LandmarkList()
                .tabItem {
                    Label("FavList", systemImage: "star")
                }
                .tag(TabType.list)
            
//            NavigationView{
//                List{
//
//                }
//                .navigationTitle("Operation")
//                .navigationBarTitleDisplayMode(.inline)
//            }
//            .tabItem {
//                Label("Operation", systemImage: "gearshape")
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
