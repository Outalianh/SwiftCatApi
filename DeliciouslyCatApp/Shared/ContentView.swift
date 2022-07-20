//
//  ContentView.swift
//  Shared
//
//  Created by Outalianh Mylondo on 18/07/2022.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var userModel = FormUserModel()
    @StateObject var breedCall = BreedCall()
    @State var breeds: [KittyBreed] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                Text("Enter your name")
                    .bold()
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                        
                        Image("cat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            //.clipShape(Circle())
                }
            Form {
                Section {
                    TextField("First name", text: $userModel.firstname)
                    TextField("Last name", text: $userModel.lastname)
                }
            }
                Button(action: {
                }) {
                    NavigationLink(destination: BreedInventoryView()){
                    
                    Text("Valider")
                        .frame(width: 250,
                               height: 50,
                               alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
            }

            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
        }
        .environmentObject(userModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
