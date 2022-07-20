//
//  UserModel.swift
//  DeliciouslyCatApp (iOS)
//
//  Created by Outalianh Mylondo on 19/07/2022.
//

import SwiftUI

class FormUserModel: ObservableObject {
    @Published var firstname: String = ""
    @Published var lastname: String = ""
}
