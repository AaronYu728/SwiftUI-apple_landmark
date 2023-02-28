//
//  LandmarkDetail.swift
//  AppleLandmarks
//
//  Created by BinYu on 28/2/2023.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmarkDetail: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmarkDetail.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmarkDetail.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmarkDetail.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmarkDetail.name)
                        .font(.title)
                    .foregroundColor(Color.orange)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmarkDetail.park)
                    Spacer()
                    Text(landmarkDetail.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                    .background(.red)
                Text("About \(landmarkDetail.name)")
                    .font(.title2)
                Text(landmarkDetail.description)
                
            }
            .padding()
//            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmarkDetail: ModelData().landmarks[0])
            .environmentObject(ModelData())
    }
}
