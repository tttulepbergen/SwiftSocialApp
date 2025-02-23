import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Фото профиля
            Image("images")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding(.top, 40)
            
            // Имя и профессия
            Text("Viago Heimburg")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 8)
            
            Text("379-year-old vampire")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Локация
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(.gray)
                Text("Wellington, New Zealand")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 4)
            
            // Статистика
            HStack(spacing: 40) {
                StatView(value: "5", label: "followers")
                StatView(value: "67", label: "following")
                StatView(value: "30", label: "likes")
            }
            .padding(.top, 20)
            
            // Кнопки
            HStack {
                Button(action: {}) {
                    Text("Edit profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 140, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {}) {
                    Text("Add friends")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 140, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

// Компонент для отображения статистики
struct StatView: View {
    let value: String
    let label: String

    var body: some View {
        VStack {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
