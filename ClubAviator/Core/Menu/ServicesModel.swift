import Foundation

struct ServicesModel: Identifiable {
        var id: String = UUID().uuidString
        var imgName: String
        var name: String
        var description: String
        var price: String
}
