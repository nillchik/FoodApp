import SwiftUI

//MARK: Struct for topic

struct Topic: Identifiable, Equatable {
    
    var id = UUID()
    let name: String
    let image: String
    
    
}


//MARK: FoodCategory enum
enum FoodCategory: String, Identifiable, CaseIterable {
    
    case pizza = "Pizza"
    case burger = "Burger"
    case sandwich = "Sandwich"
    case samosa = "Samosa"
    
    var id: Self { self }
    
    var icons: String {
        
        switch self {
            
            
            
            
        case .pizza:
            return "pizzaIcon"
        case .burger:
            return "burgerIcon"
        case .sandwich:
            return "sandwichIcon"
        case .samosa:
            return "samosaIcon"
            
        }
        
    }
    
    var borderColor: ColorResource {
        
        switch self {
            
            
            
            
        case .pizza:
            return .lightRed
        case .burger:
            return .lightGreen
        case .sandwich:
            return .lightBlue
        case .samosa:
            return .lightOrange
        }
        
        
    }
    
    var topicsForYou: [Topic] {
        
        
        
        switch self {
            
            
           
            
            
        case .pizza:
            return [Topic(name: "Cheese sides", image: "regularBun"),
                    Topic(name: "Sause", image: "sause"),
                    Topic(name: "Sausage", image: "sausage")
            
            ]
        case .burger:
            return [Topic(name: "Regular Bun", image: "regularBun"),
                    Topic(name: "Cheese", image: "cheese"),
                    Topic(name: "Meat sau", image: "meatSau")
            
            ]
        case .sandwich:
            return [Topic(name: "", image: "")]
        case .samosa:
            return [Topic(name: "", image: "")]
        }
        
        
    }
    
}





