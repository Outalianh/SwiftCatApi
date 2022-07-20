//
//  BreedInventoryView.swift
//  DeliciouslyCatApp (iOS)
//
//  Created by Outalianh Mylondo on 19/07/2022.
//

import SwiftUI

struct BreedInventoryView: View {
    
    @StateObject var breedCall = BreedCall()
    @State var breeds: [KittyBreed] = []
    @EnvironmentObject var userModel : FormUserModel
    @StateObject var catModel = CatBreed()

    
    
    var body: some View {
        NavigationView {
                ScrollView {
                    ForEach(breeds) { breed in
                            NavigationLink(destination: CatDetailView()) {
                                HStack{
                                    if breed.image?.url != nil {
                                        AsyncImage(url: URL(string: breed.image!.url)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                                }
                                                .frame(width: 130, height: 70)
                                                .background(Color.gray)
                                                .cornerRadius(3.0)
                                    } else {
                                        Image("")
                                            .frame(width: 130, height: 70)
                                            .background(Color.gray)
                                            .cornerRadius(3.0)
                                    }
                                    VStack(alignment: .leading, spacing: 5){
                                        Text(breed.name)
                                            .bold()
                                        Text(breed.description)
                                        if breed.wikipedia_url != nil {
                                           Link(destination: URL(string: breed.wikipedia_url!)!, label: {
                                               Text("Wikipedia Page")
                                                   .underline()
                                           })
                                        }
                                    }
                                }
                                .padding(3)
                                .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                                .cornerRadius(20)
                                .frame(maxHeight: 70)
                                
                        }.simultaneousGesture(TapGesture().onEnded{
                            catModel.name = breed.name
                            catModel.description = breed.description
                            if breed.image?.url != nil {
                            catModel.image = breed.image!.url
                            }
                            catModel.wiki = breed.wikipedia_url!
                        })
                        .padding(3)
                    }
                }
           
            .navigationTitle("\(userModel.firstname) \(userModel.lastname)")
            .toolbar{
                Image("cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            .onAppear{
                BreedCall().fetch { (breedsData) in
                    self.breeds = breedsData
                }
            }
        }
        .environmentObject(catModel)
    }
}

struct BreedInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        BreedInventoryView()
    }
}
