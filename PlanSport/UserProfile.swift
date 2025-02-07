//
//  UserProfile.swift
//  AFP20251
//
//  Created by apprenant85 on 30/01/2025.
//

import Foundation

class UserProfile: Identifiable, ObservableObject{
    var id  = UUID()
    @Published var username: String
    @Published var password: String
    @Published var email: String
    @Published var firstName: String?
    @Published var lastName: String?
    @Published var phoneNumber: String?
    @Published var profilePicture: String?
    @Published var address: String?

    init(username: String, password: String, email: String, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicture: String? = nil, address: String? = nil) {
        self.username = username
        self.password = password
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.profilePicture = profilePicture
        self.address = address
    }
    
}

var currentUser: UserProfile = UserProfile(username: "Admin", password: "122333", email: "john@example.com")
