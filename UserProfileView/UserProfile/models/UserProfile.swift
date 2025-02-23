//
//  UserProfile.swift
//  UserProfileView
//
//  Created by Тулепберген Анель  on 19.02.2025.
//

import Foundation

struct UserProfile: Hashable,Equatable {
    let id: UUID // Уникальный идентификатор пользователя
    let username: String
    
    var bio: String
    var followers: Int
    var avatarURL: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//!!!!
