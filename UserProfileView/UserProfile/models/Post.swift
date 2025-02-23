//
//  Post.swift
//  UserProfile
//
//  Created by Тулепберген Анель  on 21.02.2025.
//

import Foundation

// Реализация Post с поддержкой Hashable и Equatable
struct Post: Hashable, Equatable {
    let id: UUID // Уникальный идентификатор поста
    let authorId: UUID // ID автора поста
    
    var content: String // Текст поста
    var likes: Int // Количество лайков
    
    // Реализация Hashable (по id, так как он уникален и неизменяем)
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Equatable (два поста равны, если у них одинаковый id)
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }

}
//!!!!
