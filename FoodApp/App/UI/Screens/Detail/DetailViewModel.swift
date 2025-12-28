import SwiftUI



@Observable
class DetailScreenViewModel {
    
    var selectedTopics : [Topic] = []
    
    var count: Int = 1
    var cart: [CartItem] = []
    var allPrice: Double {
        
        cart.reduce(0) { ($0 + $1.totalPrice) }
    
        
        
    }
    
    func addToCart (restaraunt: Restaraunts) {
        
        let finalPrice = Double(restaraunt.price) * Double(count)
        

        
        let newItem = CartItem(image: restaraunt.image, restarauntName: restaraunt.name, count: count, selectedTopics: selectedTopics, unitPrice: 23.99, totalPrice: finalPrice)
        
        cart.append(newItem)
        
        resetSelection()
        
    }
    
    
    
    
    
    
    
    func resetSelection() {
        
        count = 1
        
        selectedTopics = []
        
        
    }
        
        
    
    
    func addProduct() {
        
        count = min(count + 1, Int.max)
        
        
        
    }
    
    
    
    func removeProduct() {
        
        count = max(count - 1, 1)
        
        
    }
    
    func topicToogle (_ topic: Topic) {
        
        if let index = selectedTopics.firstIndex(of: topic) {
            
            selectedTopics.remove(at: index)
            
        } else {
            
            selectedTopics.append(topic)
            
            
            
        }
        
        
        
    }
    
    func increaseCount(for item: CartItem) {
        
        
        if let index = cart.firstIndex(where: {$0.id == item.id}) {
            
            cart[index].count += 1
            
            cart[index].totalPrice = Double(cart[index].count) * Double(cart[index].unitPrice)
            
            
            
        }
        
        
    }
    
    func removeCount(for item: CartItem) {
        
        
        if let index = cart.firstIndex(where: {$0.id == item.id}) {
            
            if cart[index].count > 1 {
                
                
                cart[index].count -= 1
                
                cart[index].totalPrice = Double(item.totalPrice) - Double(item.unitPrice)
            } else {
                
                cart.remove(at: index)
                
                
                
            }
            
            
        }
        
        
    }
    
    
    func deleteItem(for item: CartItem) {
        
        if let index = cart.firstIndex(where: {$0.id == item.id}) {
            
            cart.remove(at: index)
            
            
        }
        
        
        
    }
    
}





