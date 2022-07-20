//
//  BreedModel.swift
//  DeliciouslyCatApp (iOS)
//
//  Created by Outalianh Mylondo on 19/07/2022.
//

import SwiftUI
import Foundation

struct KittyBreed: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let wikipedia_url: String?
    let image: BreedImage?
}

class CatBreed: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var image: String = ""
    @Published var wiki: String = ""
    
}
