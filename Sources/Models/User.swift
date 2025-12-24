import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    
    static let sampleData: [User] = [
        User(id: 1, name: "أحمد محمد", email: "ahmed@example.com", phone: "0501234567"),
        User(id: 2, name: "سارة خالد", email: "sara@example.com", phone: "0502345678"),
        User(id: 3, name: "علي حسن", email: "ali@example.com", phone: "0503456789"),
        User(id: 4, name: "فاطمة عمر", email: "fatima@example.com", phone: "0504567890"),
        User(id: 5, name: "محمد سعيد", email: "mohammed@example.com", phone: "0505678901")
    ]
}
