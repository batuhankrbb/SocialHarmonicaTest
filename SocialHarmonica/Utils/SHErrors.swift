//
//  SHErrors.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation

enum SHError: String, Error {
    
    case missingInformation = "Missing Information. Please fill all fields."
    case damagedPhotoURL = "Photo isn't uploaded. Please try again."
    case emailNotVerified = "E-Mail is not verified. Please verify your e-mail adress."
}
