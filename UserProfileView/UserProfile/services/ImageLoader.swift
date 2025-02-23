//
//  ImageLoader.swift
//  UserProfileView
//
//  Created by Тулепберген Анель  on 19.02.2025.
//


import UIKit

// Протокол для делегата ImageLoader
protocol ImageLoaderDelegate: AnyObject {
    func didLoadImage(_ image: UIImage?)
}

class ImageLoader {
    // ✅ Слабая ссылка на делегата
    weak var delegate: ImageLoaderDelegate?
    
    // 🔹 Метод загрузки изображения
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        // Запрос изображения
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let image = UIImage(data: data)
            
            // ✅ Передаём результат в main-поток
            DispatchQueue.main.async {
                completion(image)
                self.delegate?.didLoadImage(image) // Вызываем делегат
            }
        }.resume()
    }
}

//✅ ImageLoader теперь принимает URL вместо String, слабая ссылка weak на delegate, completionHandler использует [weak self], загрузка через URLSession.
