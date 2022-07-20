//
//  BreedCall.swift
//  DeliciouslyCatApp (iOS)
//
//  Created by Outalianh Mylondo on 19/07/2022.
//

import Foundation

class BreedCall: ObservableObject {
    
    func fetch(completion: @escaping ([KittyBreed]) -> ()) {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else { return }
        
        var request = URLRequest(url: url)
            request.addValue("0f70bd9e-6d97-4565-b63e-20583b0c751d", forHTTPHeaderField: "x-api-key")
       
        let task = URLSession.shared.dataTask(with: request ) { (data, _, _) in
            let fetcher = try! JSONDecoder().decode([KittyBreed].self, from: data!)
            DispatchQueue.main.async {
                completion(fetcher)
            }
        }
        task.resume()
    }
}
