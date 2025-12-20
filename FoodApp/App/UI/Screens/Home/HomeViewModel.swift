
import Foundation

@Observable
class CategoryViewModel {
    
    let categories: [FoodCategory] = FoodCategory.allCases
    var selectedCategory: FoodCategory = .burger
    
    
    private let popularRestaraunts: [Restaraunts] = [
        Restaraunts(name: "Big cheese burger", price: 23.99, image: "cheeseburger", miniDescription: "No 10 opp lekki phase 1 bridge in sangotedo estate", rating: "4+", callories: "3000cal 🔥", cookingTime: "5-10 ⏰", descritption: "Our simple, classic cheeseburger begins with a 100% pure beef burger seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped", category: .burger),
        
        Restaraunts(name: "Medium cheese burger", price: 23.99, image: "cheeseburger", miniDescription: "No 10 opp lekki phase 1 bridge in sangotedo estate", rating: "4+", callories: "3000cal 🔥", cookingTime: "5-10min ⏰", descritption: "", category: .burger)
        
        
    ]
    
    var categoriesFilter: [Restaraunts] {
        
        popularRestaraunts.filter {$0.category == selectedCategory}
        
        
    }
    
    var sumOfProducts: String {
        
        categoriesFilter.isEmpty ? "" : "(\(categoriesFilter.count))"
        
        
    }
    
    var isFilterEmpty: Bool {
        
        categoriesFilter.isEmpty
        
    }
    
}


