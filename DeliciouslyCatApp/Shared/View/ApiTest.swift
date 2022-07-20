//
//  ApiTest.swift
//  DeliciouslyCatApp (iOS)
//
//  Created by Outalianh Mylondo on 19/07/2022.
//

import SwiftUI

struct ApiTest: View {
    @State var breeds: [KittyBreed] = []
    var body: some View {
        List(breeds) { breed in
            Text(breed.id)
        }
        .onAppear{
            BreedCall().fetch { (breeds) in
                self.breeds = breeds
            }
        }
    }
}

struct ApiTest_Previews: PreviewProvider {
    static var previews: some View {
        ApiTest()
    }
}
