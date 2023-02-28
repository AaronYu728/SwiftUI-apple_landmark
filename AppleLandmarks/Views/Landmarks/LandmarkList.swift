//
//  LandmarkList.swift
//  AppleLandmarks
//
//  Created by BinYu on 28/2/2023.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoriteOnly = true
    @EnvironmentObject var modelData: ModelData
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
//                Toggle(isOn: $showFavoriteOnly) {
//                    Text("Show Favorite Only")
//                }
                Toggle("Show Favorite Only", isOn: $showFavoriteOnly)
                ForEach(filteredLandmarks) { landmarkEvery in
                    NavigationLink {
                        LandmarkDetail(landmarkDetail: landmarkEvery)
                    } label: {
                        LandmarkRow(landmark: landmarkEvery)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
    
    
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
//        ForEach (["iPhone 12", "iPhone SE (3rd generation)"], id: \.self) { devicename in
//            LandmarkList()
//                .environmentObject(ModelData())
//                .previewDevice(PreviewDevice(rawValue: devicename))
//                .previewDisplayName(devicename)
//        }
    }
}
