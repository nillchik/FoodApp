import Foundation


struct Restaraunts: Identifiable, Hashable {
    
    var id = UUID()
    let name: String
    let price: Double
    let image: String
    let miniDescription: String
    let rating: String
    let callories: String
    let cookingTime: String
    let descritption: String
    let category: FoodCategory
    
    
}
