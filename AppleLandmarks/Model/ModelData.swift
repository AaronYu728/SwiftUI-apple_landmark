//
//  ModelData.swift
//  AppleLandmarks
//
//  Created by BinYu on 28/2/2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks:[Landmark] = loadData("landmarkData.json")
    
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categoriesDic: [String: [Landmark]] {
        Dictionary(grouping: landmarks) { $0.category.rawValue }
    }
}

func loadData<T: Decodable>(_ filename: String) -> T {
    let localData: Data
    
    guard let filePath = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        localData = try Data(contentsOf: filePath)
    } catch  {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: localData)
    } catch  {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
