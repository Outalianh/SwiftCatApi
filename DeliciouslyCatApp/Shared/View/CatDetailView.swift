//
//  CatDetailView.swift
//  DeliciouslyCatApp (iOS)
//
//  Created by Outalianh Mylondo on 19/07/2022.
//

import SwiftUI

struct CatDetailView: View {
  
    @EnvironmentObject var catModel : CatBreed
    
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
        NavigationView {
            HStack {
                ScrollView {
                        AsyncImage(url: URL(string: catModel.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                                }
                                .frame(width: 400, height: 500)
                                .background(Color.gray)
                                .cornerRadius(3.0)
                    Text(catModel.name)
                        .bold()
                    Text(catModel.description)
                        .frame(width: 350)
                    Link("Wikipedia Page", destination: URL(string: catModel.wiki)!)
                }
            }
            .navigationTitle("Details")
            .navigationBarHidden(true)
        }
    }
}

struct CatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailView()
    }
}
