//
//  FeedSystem.swift
//  UserProfileView
//
//  Created by Тулепберген Анель  on 19.02.2025.
//

import Foundation

struct FeedSystem {
    // ✅ Кэш пользователей для быстрого поиска по ID (O(1))
    private var userCache: [UUID: UserProfile] = [:]

    // ✅ Лента постов (используем массив, так как в Swift нет LinkedList)
    private var feedPosts: [Post] = []

    // ✅ Уникальные хэштеги (мгновенный поиск O(1))
    private var hashtags: Set<String> = []

    // 🔹 Добавление пользователя в кэш
    mutating func addUser(_ user: UserProfile) {
        userCache[user.id] = user
    }

    // 🔹 Получение пользователя по ID
    func getUser(by id: UUID) -> UserProfile? {
        return userCache[id]
    }

    // 🔹 Добавление поста в ленту (добавляем в начало)
    mutating func addPost(_ post: Post) {
        feedPosts.insert(post, at: 0) // Вставка в начало (O(n) в массиве, но без LinkedList это лучший вариант)
        extractHashtags(from: post.content)
    }

    // 🔹 Извлекаем хэштеги из текста и добавляем в Set
    private mutating func extractHashtags(from text: String) {
        let words = text.split(separator: " ")
        for word in words where word.starts(with: "#") {
            hashtags.insert(String(word))
        }
    }

    // 🔹 Поиск постов по хэштегу
    func searchByHashtag(_ tag: String) -> [Post] {
        return feedPosts.filter { $0.content.contains("#\(tag)") }
    }
}
