
import Foundation


struct CartItem: Identifiable {
    
    var id = UUID()
    let image: String
    let restarauntName: String
    var count: Int
    var selectedTopics: [Topic]
    var unitPrice: Double
    var totalPrice: Double
    
    
}
